#! /bin/bash

mkdir -p {{ database_base_dir }}/triplebit/{{ item[1].name }}

time /opt/triplebit/buildTripleBitFromN3 {{ item[1].path }} {{ database_base_dir }}/triplebit/{{ item[1].name }}