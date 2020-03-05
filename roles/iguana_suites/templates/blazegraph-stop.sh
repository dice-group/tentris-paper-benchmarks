#! /bin/bash

if [[ ! -f blazegraph.pid ]]
then
    echo $(date --iso-8601) - Blazegraph is not running
    exit 1
fi

kill $(cat blazegraph.pid)
rm blazegraph.pid
