#! /bin/bash

mkdir -p databases/fuseki/{{ item[1].name }}/

cgmemtime /opt/jena/apache-jena-{{ jena_version }}/bin/tdb2.tdbloader --loader=parallel --loc databases/fuseki/{{ item[1].name }}/ {{ item[1].path }} 2>&1 | tee fuseki-load-{{ item[1].name }}.log