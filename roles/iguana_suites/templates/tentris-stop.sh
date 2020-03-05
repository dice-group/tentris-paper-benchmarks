#! /bin/bash

if [[ ! -f tentris.pid ]]
then
    echo $(date --iso-8601) - Tentris is not running
    exit 1
fi

kill $(cat tentris.pid)
rm tentris.pid
