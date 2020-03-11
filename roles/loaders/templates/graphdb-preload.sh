#! /bin/bash

mkdir -p {{ target_dir }}/databases/graphdb/{{ item.name }}/data/

cgmemtime java -Xmx512G -cp "{{ target_dir }}/triplestores/graphdb/graphdb-free-{{ graphdb_version }}/lib/*" -Dgraphdb.dist={{ target_dir }}/triplestores/graphdb/graphdb-free-{{ graphdb_version }} -Dgraphdb.home.data={{ target_dir }}/databases/graphdb/{{ item.name }}/data/ -Djdk.xml.entityExpansionLimit=0 com.ontotext.graphdb.loadrdf.PreloadData -f -p -c {{ target_dir }}/triplestores/graphdb/graphdb-{{ item.name }}.ttl {{ item.path }} 2>&1 | tee {{ target_dir }}/logs/load/graphdb-preload-{{ item.name }}.log
