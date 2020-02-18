#! /bin/bash

mkdir -p {{ database_base_dir }}/gstore/{{ item[1].name }}
mkdir -p {{ database_base_dir }}/gstore/{{ item[1].name }}/.tmp
mkdir -p {{ database_base_dir }}/gstore/{{ item[1].name }}/logs/endpoint
cd {{ database_base_dir }}/gstore/{{ item[1].name }}

cp -r /opt/gstore/data {{ database_base_dir }}/gstore/{{ item[1].name }}
cp -r /opt/gstore/Server {{ database_base_dir }}/gstore/{{ item[1].name }}

/opt/gstore/bin/ginit

time /opt/gstore/bin/gbuild {{ item[1].name }} {{ item[1].path }}
