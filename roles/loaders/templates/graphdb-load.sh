#! /bin/bash

mkdir -p {{ target_dir }}/databases/graphdb/{{ item[1].name }}/data/

cgmemtime java -Xmx512G -cp "{{ target_dir }}/triplestores/graphdb/graphdb-free-{{ graphdb_version }}/lib/*" -Dgraphdb.dist={{ target_dir }}/triplestores/graphdb/graphdb-free-{{ graphdb_version }} -Dgraphdb.home.data={{ target_dir }}/databases/graphdb/{{ item[1].name }}/data/ -Djdk.xml.entityExpansionLimit=0 com.ontotext.graphdb.loadrdf.LoadRDF -f -m parallel -p -c {{ target_dir }}/triplestores/graphdb/graphdb-{{ item[1].name }}.ttl {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/load/graphdb-{{ item[1].name }}.log
