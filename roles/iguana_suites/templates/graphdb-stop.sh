#! /bin/bash

if [[ -n graphdb.pid ]]
then
    echo $(date --iso-8601) - GraphDB is not running
    exit 1
fi

kill $(cat graphdb.pid)
rm graphdb.pid
