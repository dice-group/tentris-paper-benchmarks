#! /bin/bash

mkdir -p {{ database_base_dir }}/triplebit/{{ item[1].name }}

time buildTripleBitFromN3 {{ item[1].path }} /var/lib/triplebit/{{ item[1].name }}