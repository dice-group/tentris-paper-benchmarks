#! /bin/bash

if [[ -f graphdb.pid ]]
then
    echo $(date --iso-8601) - GraphDB seems to be already running
    echo If it is not running remove graphdb.pid
    exit 1
fi

echo $(date --iso-8601) - Starting GraphDB

/opt/graphdb/graphdb-free-{{ graphdb_version }}/bin/graphdb -X mx{{ item[1].max_ram }}K -X X:ActiveProcessorCount={{ item[2].number }} -p graphdb.pid -s -Dgraphdb.home=$(pwd)/databases/graphdb/{{ item[1].name }}

echo $(date --iso-8601) - Waiting for GraphDB to become available

while :
do
    curl -s 127.0.0.1:7200
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - GraphDB started and accepting connections