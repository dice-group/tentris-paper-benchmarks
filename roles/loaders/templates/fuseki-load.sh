#! /bin/bash

mkdir -p databases/fuseki/{{ item[1].name }}/

cgmemtime sudo -u $USER /opt/jena/apache-jena-{{ jena_version }}/bin/tdb2.tdbloader --loader=parallel --loc databases/fuseki/{{ item[1].name }}/ {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/fuseki-load-{{ item[1].name }}.log