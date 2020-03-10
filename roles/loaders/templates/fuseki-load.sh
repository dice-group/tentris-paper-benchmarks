#! /bin/bash

mkdir -p {{ target_dir }}/databases/fuseki/{{ item[1].name }}/

cgmemtime  {{ target_dir }}/triplestores/jena/apache-jena-{{ jena_version }}/bin/tdb2.tdbloader --loader=parallel --loc {{ target_dir }}/databases/fuseki/{{ item[1].name }}/ {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/load/fuseki-{{ item[1].name }}.log
