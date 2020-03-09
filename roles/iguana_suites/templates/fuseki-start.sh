#! /bin/bash

if [[ -f fuseki.pid ]]
then
    echo $(date --iso-8601) - Fuseki seems to be already running
    echo If it is not running remove fuseki.pid
    exit 1
fi

echo $(date --iso-8601) - Starting Fuseki

java -Xmx{{ item[1].max_ram }}K -XX:ActiveProcessorCount={{ item[2].number }} -jar {{ target_dir }}/triplestores/fuseki/apache-jena-fuseki-{{ fuseki_version }}/fuseki-server.jar --tdb2 --loc=databases/fuseki/{{ item[1].name }} /{{ item[1].name }} & disown
pid=$!

echo $pid > fuseki.pid

echo $(date --iso-8601) - Waiting for Fuseki to become available

while :
do
    curl -s 127.0.0.1:3030
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - Fuseki started and accepting connections