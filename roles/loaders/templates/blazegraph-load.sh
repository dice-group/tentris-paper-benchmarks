#! /bin/bash

mkdir -p {{ target_dir }}/databases/blazegraph/{{ item[1].name }}
dir=$(pwd)
cd {{ target_dir }}/databases/blazegraph/{{ item[1].name }}

cgmemtime java -Xmx512G -cp {{ target_dir }}/triplestores/blazegraph/blazegraph.jar -Djava.io.tmpdir=./ com.bigdata.rdf.store.DataLoader {{ target_dir }}/triplestores/blazegraph/application.properties {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/load/blazegraph-{{ item[1].name }}.log

cd $pwd
