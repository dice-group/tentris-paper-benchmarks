#!/bin/bash

bash "{{ target_dir }}/iguana_suites/http/tentris-{{ item[0] }}/{{ item[1].name }}/1-start.sh"

cd "{{ target_dir }}" || exit

sparql_result_analysis --url "{{ endpoint }}" --queries "{{ queries_path }}" --datasetname "{{ datasetname }}" --storename "tentris-{{ item[0] }}" --dont-save 2>&1 | tee {{ target_dir }}/logs/parse_sparql_results/tentris-{{ item[0] }}-{{ datasetname }}.log

bash "{{ target_dir }}/iguana_suites/http/tentris-{{ item[0] }}/stop.sh"