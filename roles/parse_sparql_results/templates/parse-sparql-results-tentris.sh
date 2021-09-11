#!/bin/bash

bash "{{ target_dir }}/iguana_suites/http/tentris-{{ item[0] }}/{{ item[1].name }}/1-start.sh"

cd "{{ target_dir }}" || exit

sparql_result_analysis --url "http://localhost:9080/stream" --queries "{{ item[1].queries_path }}" --datasetname "{{ item[1].name }}" --storename "tentris-{{ item[0] }}" --save-only-error \
--output "{{ target_dir }}/results_parsed_tentris-{{ item[0] }}-{{ item[1].name }}.csv" \
2>&1 | tee {{ target_dir }}/logs/parse_sparql_results/tentris-{{ item[0] }}-{{ item[1].name }}.log

bash "{{ target_dir }}/iguana_suites/http/tentris-{{ item[0] }}/stop.sh"
