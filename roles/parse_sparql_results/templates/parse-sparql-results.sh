#!/bin/bash

bash "{{ target_dir }}/iguana_suites/http/{{ item[0].name }}/{{ item[1].name }}/1-start.sh"

cd "{{ target_dir }}" || exit

sparql_result_analysis --url "{{ item[0].connection_url }}" --queries "{{ item[1].queries_path }}" --datasetname "{{ item[1].name }}" --storename "{{ item[0].name }}" --dont-save 2>&1 | tee {{ target_dir }}/logs/parse_sparql_results/{{ item[0].name }}-{{ item[1].name }}.log

bash "{{ target_dir }}/iguana_suites/http/{{ item[0].name }}/stop.sh"
