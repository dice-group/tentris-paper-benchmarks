#! /bin/bash

mkdir -p {{ target_dir }}/databases/fuseki-ltj/{{ item[1].name }}/

cgmemtime  {{ target_dir }}/triplestores/fuseki-ltj/apache-jena-3.9.0/bin/tdbloader2 --loc {{ target_dir }}/databases/fuseki-ltj/{{ item[1].name }}/ {{ item[1].path }} 2>&1 |& tee {{ target_dir }}/logs/load/fuseki-ltj-{{ item[1].name }}.log
