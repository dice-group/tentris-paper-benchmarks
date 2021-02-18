#!/bin/bash

bash "{{ target_dir }}/iguana_suites/http/tentris-{{ item[0] }}/{{ item[1].name }}/{{ item[2].number }}-start.sh"

cd "{{ target_dir }}" || exit

sparql_result_analysis --url "{{ endpoint }}" --queries "{{ queries_path }}" --datasetname "{{ datasetname }}" --storename "{{ triplestore_name }}" --dont-save

bash "{{ target_dir }}/iguana_suites/http/tentris-{{ item[0] }}/stop.sh"