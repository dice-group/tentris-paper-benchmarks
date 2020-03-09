#! /bin/bash

mkdir -p databases/virtuoso/{{ item[1].name }}/database
mkdir -p databases/virtuoso/{{ item[1].name }}/vad
mkdir -p databases/virtuoso/{{ item[1].name }}/vsp

cgmemtime  {{ target_dir }}/triplestores/virtuoso/{{ virtuoso_version }}/virtuoso-opensource/bin/virtuoso-t -c {{ target_dir }}/triplestores/virtuoso/virtuoso-load-{{ item[1].name }}.ini +foreground &

while :
do
    curl -s 127.0.0.1:8890
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 1
done

time {{ target_dir }}/triplestores/virtuoso/{{ virtuoso_version }}/virtuoso-opensource/bin/isql << EOF 2>&1 | tee {{ target_dir }}/logs/virtuoso-load-{{ item[1].name }}.log
ld_dir ('{{ item[1].path | regex_replace('^(.*)/.*\.nt$', '\\1') }}', '*.nt', 'http://example.com');
rdf_loader_run();
checkpoint;
shutdown;
EOF

while :
do
    curl -s 127.0.0.1:8890
    if [ $? -ne 0 ]
    then
        break
    fi
    sleep 1
done
