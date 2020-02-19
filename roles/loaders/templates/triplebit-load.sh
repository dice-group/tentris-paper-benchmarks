#! /bin/bash

sudo -u triplebit mkdir -p {{ database_base_dir }}/triplebit/{{ item[1].name }}

sudo -u triplebit bash -c "time /opt/triplebit/buildTripleBitFromN3 {{ item[1].path }} {{ database_base_dir }}/triplebit/{{ item[1].name }}"