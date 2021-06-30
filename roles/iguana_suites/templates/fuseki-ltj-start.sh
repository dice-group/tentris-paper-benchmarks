#! /bin/bash

if [[ -f {{ target_dir }}/fuseki-ltj.pid ]]
then
    echo $(date --iso-8601) - fuseki-ltj seems to be already running
    echo If it is not running remove fuseki-ltj.pid
    exit 1
fi

echo $(date --iso-8601) - Starting fuseki-ltj

dir=$(pwd)

cd {{ target_dir }}/triplestores/fuseki-ltj/apache-jena-fuseki-ltj

java -Xmx{{ item[1].max_ram }}K -XX:ActiveProcessorCount={{ item[2].number }} -jar {{ target_dir }}/triplestores/fuseki-ltj/fuseki-leapfrog.jar --loc={{ target_dir }}/databases/fuseki-ltj/{{ item[1].name }} /{{ item[1].name }} </dev/null 2>&1 >{{ target_dir }}/logs/run/fuseki-ltj-{{ item[1].name }}-{{ item[2].number }}.log & disown
pid=$!

echo $pid > {{ target_dir }}/fuseki-ltj.pid

echo $(date --iso-8601) - Waiting for fuseki-ltj to become available

while :
do
    curl -s 127.0.0.1:3030
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - fuseki-ltj started and accepting connections

cd $dir
