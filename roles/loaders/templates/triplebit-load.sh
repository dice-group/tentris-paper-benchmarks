#! /bin/bash

sudo -u triplebit mkdir -p {{ database_base_dir }}/triplebit/{{ item[1].name }}

sudo cgmemtime sudo -u triplebit bash -c "cd {{ database_base_dir }}/triplebit/{{ item[1].name }} && /opt/triplebit/buildTripleBitFromN3 {{ item[1].path }} {{ database_base_dir }}/triplebit/{{ item[1].name }}" 2>&1 | tee triplebit-load-{{ item[1].name }}.log
