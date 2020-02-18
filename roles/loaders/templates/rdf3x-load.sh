#! /bin/bash

mkdir -p {{ database_base_dir }}/rdf3x/{{ item[1].name }}

time /opt/rdf3x/rdf3xload {{ database_base_dir }}/rdf3x/{{ item[1].name }}/db {{ item[1].path }}