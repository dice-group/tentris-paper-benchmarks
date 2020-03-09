#! /bin/bash

mkdir -p databases/graphdb/{{ item[1].name }}/data/

cgmemtime java -Xmx512G -cp "{{ target_dir }}/triplestores/graphdb/graphdb-free-{{ graphdb_version }}/lib/*" -Dgraphdb.dist={{ target_dir }}/triplestores/graphdb/graphdb-free-{{ graphdb_version }} -Dgraphdb.home.data=$(pwd)/databases/graphdb/{{ item[1].name }}/data/ -Djdk.xml.entityExpansionLimit=0 com.ontotext.graphdb.loadrdf.LoadRDF -f -m parallel -p -c {{ target_dir }}/triplestores/graphdb/graphdb-{{ item[1].name }}.ttl {{ item[1].path }} 2>&1 | tee graphdb-load-{{ item[1].name }}.log
