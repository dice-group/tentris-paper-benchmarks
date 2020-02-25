#! /bin/bash

sudo systemctl start tentris-1.0.3-tsl_sparse_set@{{ item[1].path | replace('/', '-') }}.service

while :
do
    curl -q 127.0.0.1:9080
    if [ $? -eq 0 ]
    then
        break
    fi
done
