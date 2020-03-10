#! /bin/bash

cgmemtime  {{ target_dir }}/triplestores/tentris/{{ item[0] }}/tentris_terminal --logfile false --logstdout -f {{ item[1].path }} << EOF 2>&1 | tee {{ target_dir }}/logs/load/tentris-{{ item[0] }}-{{ item[1].name }}.log
EOF
