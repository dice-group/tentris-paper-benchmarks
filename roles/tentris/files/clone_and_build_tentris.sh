#!/bin/bash

main() {
  version="none"
  is_baseline="none"
  lsb_unused="none"

  command_str="sh clone_and_build_tentris.sh [tentris_version_tag]"
  error_msg1="Use the command like:"
  error_msg3="NOTE: tentris versions may look like 1.0.7-rc3, 1.1.0-rc13_lsb_unused_1 or 1.1.0-rc13_lsb_unused_0"

  if [ -z $1 ]; then
    echo "${error_msg1}"
    echo "${command_str}"
    echo "${error_msg3}"
    exit
  fi

  if echo "$1" | grep -q "_lsb_unused_"; then
    is_baseline=0
    version=$(echo $1 | grep -oP '(?<=^).+(?=_lsb_unused_)')
    lsb_unused=$(echo $1 | grep -oP '(?<=_lsb_unused_).+(?=$)')
  elif echo "$1" | grep -q "hashing_only"; then
    is_baseline=0
    version=$(echo $1 | grep -oP '(?<=^).+(?=_hashing_only)')
    lsb_unused="h"
  else
    is_baseline=1
    version=$1
    lsb_unused=1
  fi

  if [ "${version}" == "none" ] || [ "${is_baseline}" == "none" ] || [ "${lsb_unused}" == "none" ]; then
    echo "${error_msg1}"
    echo "${command_str}"
    echo "${error_msg3}"
    exit
  fi

  echo "version ${version}"
  echo "is_baseline ${is_baseline}"
  echo "lsb_unused ${lsb_unused}"

  tentris_full_version="$1"
  clone_and_build "${version}" "${is_baseline}" "${lsb_unused}" "${tentris_full_version}"
}

# clones and builds Tentris
function clone_and_build() {
  # args
  local version=$1
  local is_baseline=$2
  local lsb_unused=$3
  local tentris_full_version=$4

  local working_dir
  working_dir=$(pwd)

  tentris_code_dir="tentris_code_${version}_$(tr -dc a-z </dev/urandom | head -c 16)"
  git clone -b "$version" --depth 1 https://github.com/dice-group/tentris.git "${tentris_code_dir}" || exit

  cd "${tentris_code_dir}" || exit

  mkdir build && cd "$_" || exit

  if [ "${is_baseline}" -eq 0 ] && [ "${lsb_unused}" -eq 0 ]; then
    echo "Building node-based Tentris version ${version} with lsb_unused=false."

    # change lsb-unused from true to false
    sed -i 's/true>;/false>;/g' ../src/lib/tentris/tensor/BoolHypertrie.hpp || exit

    build_with_docker "${version}"

    # change lsb-unused back
    sed -i 's/false>;/true>;/g' ../src/lib/tentris/tensor/BoolHypertrie.hpp
  elif [ "${is_baseline}" -eq 0 ] && [ "${lsb_unused}" = "h" ]; then
    echo "Building node-based Tentris version ${version} with hashing only."

    # change lsb-unused from true to false and compressed_nodes to false
    sed -i 's/true>;/false, false>;/g' ../src/lib/tentris/tensor/BoolHypertrie.hpp || exit

    build_with_docker "${version}"

    # change lsb-unused and compressed_nodes back
    sed -i 's/false, false>;/true>;/g' ../src/lib/tentris/tensor/BoolHypertrie.hpp
  else

    echo "Building baseline Tentris version ${version}."

    build_with_docker "${version}"
  fi

  local tentris_deploy_dir
  tentris_deploy_dir="${working_dir}/tentris_${tentris_full_version}"

  mkdir "${tentris_deploy_dir}" || exit

  cp ./* "${tentris_deploy_dir}"
  cd "$working_dir" || exit

  rm -rf "${tentris_code_dir}"
}

# builds Tentris placed in the parent folder
function build_with_docker() {
  # args
  local version=$1

  local container_id
  local container_name
  container_name="tentris_${version}_$(tr -dc a-z </dev/urandom | head -c 16)"
  docker build --no-cache --build-arg TENTRIS_MARCH=native -t "${container_name}" ..
  container_id=$(docker create "${container_name}")
  docker cp "${container_id}":/tentris_server ./tentris_server
  docker cp "${container_id}":/tentris_terminal ./tentris_terminal
  docker cp "${container_id}":/rdf2ids ./rdf2ids
  docker cp "${container_id}":/ids2hypertrie ./ids2hypertrie
  docker container rm "${container_id}"
  docker image rm "${container_name}"
  echo "Binaries $(ls) were written to $(pwd)."
}

main "$@"
