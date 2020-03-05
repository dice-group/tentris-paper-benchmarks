#! /bin/bash

mkdir -p databases/triplebit/{{ item[1].name }}
dir=$(pwd)
cd databases/triplebit/{{ item[1].name }}

cgmemtime /opt/triplebit/buildTripleBitFromN3 {{ item[1].path }} databases/triplebit/{{ item[1].name }} 2>&1 | tee $dir/triplebit-load-{{ item[1].name }}.log

cd $dir
