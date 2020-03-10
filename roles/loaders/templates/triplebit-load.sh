#! /bin/bash

mkdir -p {{ target_dir }}/databases/triplebit/{{ item[1].name }}
dir=$(pwd)
cd {{ target_dir }}/databases/triplebit/{{ item[1].name }}

cgmemtime {{ target_dir }}/triplestores/triplebit/buildTripleBitFromN3 {{ item[1].path }} {{ target_dir }}/databases/triplebit/{{ item[1].name }} 2>&1 | tee {{ target_dir }}/logs/load/triplebit-{{ item[1].name }}.log

cd $dir
