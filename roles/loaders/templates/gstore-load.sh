#! /bin/bash

mkdir -p databases/gstore/{{ item[1].name }}
mkdir -p databases/gstore/{{ item[1].name }}/.tmp
mkdir -p databases/gstore/{{ item[1].name }}/logs/endpoint

cp -r /opt/gstore/data databases/gstore/{{ item[1].name }}
cp -r /opt/gstore/Server databases/gstore/{{ item[1].name }}

dir=$(pwd)

cd databases/gstore/{{ item[1].name }}

/opt/gstore/bin/ginit

cgmemtime /opt/gstore/bin/gbuild {{ item[1].name }} {{ item[1].path }} 2>&1 | tee $dir/gstore-load-{{ item[1].name }}.log

cd $dir
