#! /bin/bash

mkdir -p databases/blazegraph/{{ item[1].name }}
dir=$(pwd)
cd databases/blazegraph/{{ item[1].name }}

cgmemtime  java -Xmx512G -cp /opt/blazegraph/blazegraph.jar -Djava.io.tmpdir=./ com.bigdata.rdf.store.DataLoader /opt/blazegraph/application.properties {{ item[1].path }} 2>&1 | tee {{ ansible_user_dir }}/logs/blazegraph-load-{{ item[1].name }}.log

cd $pwd
