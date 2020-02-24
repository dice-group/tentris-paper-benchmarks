#! /bin/bash

sudo -u virtuoso mkdir -p {{ database_base_dir }}/virtuoso/{{ item[1].name }}/database
sudo -u virtuoso mkdir -p {{ database_base_dir }}/virtuoso/{{ item[1].name }}/vad
sudo -u virtuoso mkdir -p {{ database_base_dir }}/virtuoso/{{ item[1].name }}/vsp

sudo systemctl start virtuoso@{{ item[1].name }}.service

sleep 30 # Wait for server to come online

time /opt/virtuoso/{{ virtuoso_version }}/virtuoso-opensource/bin/isql << EOF
ld_dir ('{{ item[1].path | regex_replace('^(.*)/.*\.nt$', '\\1') }}', '*.nt', 'http://dbpedia.org');
rdf_loader_run();
checkpoint;
checkpoint_interval(60);
scheduler_interval(10);
EOF

sudo systemctl stop virtuoso@{{ item[1].name }}.service
