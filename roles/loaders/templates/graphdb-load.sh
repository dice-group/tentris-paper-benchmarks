#! /bin/bash

sudo -u graphdb mkdir -p {{ database_base_dir }}/graphdb/{{ item[1].name }}/data/

sudo -u graphdb bash -c "time java -cp \"/opt/graphdb/graphdb-free-{{ graphdb_version }}/lib/*\" -Dgraphdb.dist=/opt/graphdb/graphdb-free-{{ graphdb_version }} -Dgraphdb.home.data={{ database_base_dir }}/graphdb/{{ item[1].name }}/data/ -Djdk.xml.entityExpansionLimit=0 com.ontotext.graphdb.loadrdf.LoadRDF -f -m parallel -c /opt/graphdb/graphdb-{{ item[1].name }}.ttl {{ item[1].path }}"
