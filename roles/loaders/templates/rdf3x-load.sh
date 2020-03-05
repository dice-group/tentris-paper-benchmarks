#! /bin/bash

mkdir -p databases/rdf3x/{{ item[1].name }}

cgmemtime /opt/rdf3x/rdf3xload databases/rdf3x/{{ item[1].name }}/db {{ item[1].path }} 2>&1 | tee rdf3x-load-{{ item[1].name }}.log