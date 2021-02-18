#!/bin/bash

bash "{{ target_dir }}/iguana_suites/http/{{ triplestore_name }}/{{ datasetname }}/1-start.sh"

cd "{{ target_dir }}" || exit

sparql_result_analysis --url "{{ endpoint }}" --queries "{{ queries_path }}" --datasetname "{{ datasetname }}" --storename "{{ triplestore_name }}" --dont-save 2>&1 | tee {{ target_dir }}/logs/parse_sparql_results/{{ triplestore_name }}-{{ datasetname }}.log

bash "{{ target_dir }}/iguana_suites/http/{{ triplestore_name }}/stop.sh"