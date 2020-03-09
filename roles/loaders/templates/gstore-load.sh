#! /bin/bash

mkdir -p databases/gstore/{{ item[1].name }}
mkdir -p databases/gstore/{{ item[1].name }}/.tmp
mkdir -p databases/gstore/{{ item[1].name }}/logs/endpoint

cp -r {{ target_dir }}/triplestores/gstore/data databases/gstore/{{ item[1].name }}
cp -r {{ target_dir }}/triplestores/gstore/Server databases/gstore/{{ item[1].name }}

dir=$(pwd)

cd databases/gstore/{{ item[1].name }}

{{ target_dir }}/triplestores/gstore/bin/ginit

cgmemtime  {{ target_dir }}/triplestores/gstore/bin/gbuild {{ item[1].name }} {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/gstore-load-{{ item[1].name }}.log

cd $dir
