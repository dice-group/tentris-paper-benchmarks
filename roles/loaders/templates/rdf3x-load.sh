#! /bin/bash

mkdir -p databases/rdf3x/{{ item[1].name }}

cgmemtime  {{ target_dir }}/triplestores/rdf3x/rdf3xload {{ ansible_user_dir }}/databases/rdf3x/{{ item[1].name }}/db {{ item[1].path }} 2>&1 | tee {{ ansible_user_dir }}/logs/rdf3x-load-{{ item[1].name }}.log