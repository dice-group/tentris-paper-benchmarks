#! /bin/bash

if [[ -f tentris.pid ]]
then
    echo $(date --iso-8601) - Tentris seems to be already running
    echo If it is not running remove tentris.pid
    exit 1
fi

echo $(date --iso-8601) - Starting Tentris

taskset {{ item[2].cpu_mask }} /opt/tentris/{{ item[0] }}/tentris_server -f {{ item[1].path }} & disown
pid=$!

echo $pid > tentris.pid

echo $(date --iso-8601) - Waiting for Tentris to become available

while :
do
    curl -s 127.0.0.1:9080
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - Tentris started and accepting connections
pplication.properties {{ item[1].path }}" 2>&1 | tee blazegraph-load-{{ item[1].name }}.log