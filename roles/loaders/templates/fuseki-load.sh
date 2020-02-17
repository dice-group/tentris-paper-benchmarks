#! /bin/bash

mkdir -p {{ database_base_dir }}/fuseki/{{ item[1].name }}/

time /opt/jena/apache-jena-{{ jena_version }}/bin/tdb2.tdbloader --loader=parallel --loc {{ database_base_dir }}/fuseki/{{ item[1].name }}/ {{ item[1].path }}