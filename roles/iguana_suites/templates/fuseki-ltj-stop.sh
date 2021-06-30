#! /bin/bash

if [[ ! -f {{ target_dir }}/fuseki-ltj.pid ]]
then
    echo $(date --iso-8601) - fuseki-ltj is not running
    exit 1
fi

kill $(cat {{ target_dir }}/fuseki-ltj.pid) >/dev/null
sleep 10
kill -9 $(cat {{ target_dir }}/fuseki-ltj.pid) >/dev/null

rm {{ target_dir }}/fuseki-ltj.pid
