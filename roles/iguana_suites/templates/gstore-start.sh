#! /bin/bash

if [[ -f {{ target_dir }}/gstore.pid ]]
then
    echo $(date --iso-8601) - gStore seems to be already running
    echo If it is not running remove gstore.pid
    exit 1
fi

echo $(date --iso-8601) - Starting gStore

cd {{ target_dir }}/databases/gstore/{{ item[1].name }}
{{ target_dir }}/triplestores/gstore/bin/ghttp {{ item[1].name }} </dev/null 2>&1 >{{ target_dir }}/logs/run/gstore-{{ item[1].name }}-{{ item[2].number }}.log & disown
pid=$!

echo $pid > {{ target_dir }}/gstore.pid

echo $(date --iso-8601) - Waiting for gStore to become available

while :
do
    curl -s 127.0.0.1:9000
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - gStore started and accepting connections
