#! /bin/bash

mkdir -p {{ target_dir }}/databases/gstore/{{ item[1].name }}
mkdir -p {{ target_dir }}/databases/gstore/{{ item[1].name }}/.tmp
mkdir -p {{ target_dir }}/databases/gstore/{{ item[1].name }}/logs/endpoint

cp -r {{ target_dir }}/triplestores/gstore/data {{ target_dir }}/databases/gstore/{{ item[1].name }}
cp -r {{ target_dir }}/triplestores/gstore/Server {{ target_dir }}/databases/gstore/{{ item[1].name }}

dir=$(pwd)

cd {{ target_dir }}/databases/gstore/{{ item[1].name }}

{{ target_dir }}/triplestores/gstore/bin/ginit

cgmemtime  {{ target_dir }}/triplestores/gstore/bin/gbuild {{ item[1].name }} {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/load/gstore-{{ item[1].name }}.log

cd $dir
