#! /bin/bash

mkdir -p databases/graphdb/{{ item[1].name }}/data/

cgmemtime /opt/graphdb/graphdb-free-{{ graphdb_version }}/bin/loadrdf -f -m parallel -p -c /opt/graphdb/graphdb-{{ item[1].name }}.ttl {{ item[1].path }} 2>&1 | tee graphdb-load-{{ item[1].name }}.log
