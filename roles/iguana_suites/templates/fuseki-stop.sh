#! /bin/bash

if [[ -n fuseki.pid ]]
then
    echo $(date --iso-8601) - Fuseki is not running
    exit 1
fi

kill $(cat fuseki.pid)
rm fuseki.pid
