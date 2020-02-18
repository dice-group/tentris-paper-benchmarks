#! /bin/bash

mkdir -p {{ database_base_dir }}/graphdb/{{ item[1].name }}/data/

time /opt/graphdb/graphdb-se-{{ graphdb_version }}/bin/loadrdf -Dgraphdb.home.data={{ database_base_dir }}/graphdb/{{ item[1].name }}/data/ -f -m parallel -c /opt/graphdb/graphdb-{{ item[1].name }}.ttl {{ item[1].path }}
