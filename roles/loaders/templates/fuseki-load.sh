#! /bin/bash

sudo -u fuseki mkdir -p {{ database_base_dir }}/fuseki/{{ item[1].name }}/

sudo -u fuseki bash -c "time /opt/jena/apache-jena-{{ jena_version }}/bin/tdb2.tdbloader --loader=parallel --loc {{ database_base_dir }}/fuseki/{{ item[1].name }}/ {{ item[1].path }}"