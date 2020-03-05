#! /bin/bash

if [[ -n virtuoso.pid ]]
then
    echo $(date --iso-8601) - Virtuoso is not running
    exit 1
fi

kill $(cat virtuoso.pid)
rm virtuoso.pid
