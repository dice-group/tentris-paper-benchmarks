#! /bin/bash

mkdir -p {{ target_dir }}/databases/tentris/{{ item[0] }}

{{ target_dir }}/triplestores/tentris/{{ item[0] }}/tentris_loader \
    --logfile false \
    --logstdout \
    --file {{ item[1].path }} \
    --storage {{ target_dir }}/databases/tentris/{{ item[0] }}/{{ item[1].name }} \
    << EOF 2>&1 | tee {{ target_dir }}/logs/load/tentris-{{ item[0] }}-{{ item[1].name }}.log
EOF
