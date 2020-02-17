#! /bin/bash

mkdir -p {{ database_base_dir }}/gstore/{{ item[1].name }}
mkdir -p {{ database_base_dir }}/gstore/{{ item[1].name }}/.tmp
cd {{ database_base_dir }}/gstore/{{ item[1].name }}

time /opt/gstore/bin/gbuild {{ item[1].name }} {{ item[1].path }}

rm -r {{ database_base_dir }}/gstore/{{ item[1].name }}/.tmp