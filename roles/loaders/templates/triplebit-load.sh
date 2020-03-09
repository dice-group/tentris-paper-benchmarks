#! /bin/bash

mkdir -p databases/triplebit/{{ item[1].name }}
dir=$(pwd)
cd databases/triplebit/{{ item[1].name }}

cgmemtime {{ target_dir }}/triplestores/triplebit/buildTripleBitFromN3 {{ item[1].path }} {{ target_dir }}/databases/triplebit/{{ item[1].name }} 2>&1 | tee {{ target_dir }}/logs/triplebit-load-{{ item[1].name }}.log

cd $dir
