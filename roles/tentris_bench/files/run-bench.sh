#!/bin/bash
# add here the names of the triple stores you want to benchmark
# the script should be run with sudo and in the home directory of the playbook on the server
# Example: triplestores=( "fuseki" "virtuoso" "graphdb" "tentris" ) (Pay attention to the syntax of the list)
triplestores=(  ) # add triplestores
workers=1 # number of workers
# set your dataset here (e.g., swdf)
dataset=""
echo "Running the benchmark"
for ts in "${triplestores[@]}"
do
    # clear caches
    echo 3 >/proc/sys/vm/drop_caches
    # start the triple store
    echo "$(date): Starting $ts" for "$dataset"
    ./iguana_suites/http/"$ts"/"$dataset"/"$workers"-start.sh &> /dev/null
    # start the suite
    echo "$(date): Running IGUANA (Query Mixes) for $ts" and "$dataset"
    ./iguana-run.sh ./iguana_suites/http/"$ts"/"$dataset"/"$workers"-QM.yml &> /dev/null
    # stop the system
    echo "$(date): Stopping $ts"
    ./iguana_suites/http/"$ts"/stop.sh &> /dev/null
done