#! /bin/bash

cgmemtime sudo -u $USER /opt/tentris/{{ item[0] }}/tentris_terminal --logfile false --logstdout -f {{ item[1].path }} << EOF 2>&1 | tee {{ target_dir }}/logs/tentris-{{ item[0] }}-load-{{ item[1].name }}.log
EOF