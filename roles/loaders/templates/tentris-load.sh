#! /bin/bash

mkdir -p {{ target_dir }}/databases/tentris/{{ item[0] }}

cgmemtime {{ target_dir }}/triplestores/tentris/{{ item[0] }}/tentris -s {{ target_dir }}/databases/tentris/{{ item[0] }}/{{ item[1].name }} load < {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/load/tentris-{{ item[0] }}-{{ item[1].name }}.log
