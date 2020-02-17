#! /bin/bash

mkdir -p {{ database_base_dir }}/rdf3x/{{ item[1].name }}

time rdf3xload {{ database_base_dir }}/rdf3x/{{ item[1].name }} {{ item[1].path }}