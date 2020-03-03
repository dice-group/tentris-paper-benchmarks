#! /bin/bash

sudo -u graphdb mkdir -p {{ database_base_dir }}/graphdb/{{ item[1].name }}/data/

sudo cgmemtime sudo -u graphdb java -cp "/opt/graphdb/graphdb-free-{{ graphdb_version }}/lib/*" -Dgraphdb.dist=/opt/graphdb/graphdb-free-{{ graphdb_version }} -Dgraphdb.home.data={{ database_base_dir }}/graphdb/{{ item[1].name }}/data/ -Djdk.xml.entityExpansionLimit=0 com.ontotext.graphdb.loadrdf.LoadRDF -f -m parallel -p -c /opt/graphdb/graphdb-{{ item[1].name }}.ttl {{ item[1].path }} 2>&1 | tee graphdb-load-{{ item[1].name }}.log
