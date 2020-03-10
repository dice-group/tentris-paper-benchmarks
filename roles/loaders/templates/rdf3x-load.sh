#! /bin/bash

mkdir -p {{ target_dir }}/databases/rdf3x/{{ item[1].name }}

cgmemtime  {{ target_dir }}/triplestores/rdf3x/rdf3xload {{ target_dir }}/databases/rdf3x/{{ item[1].name }}/db {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/load/rdf3x-{{ item[1].name }}.log
