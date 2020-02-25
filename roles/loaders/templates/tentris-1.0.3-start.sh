#! /bin/bash

sudo systemctl start tentris-1.0.3@{{ item[1].path | replace('/', '-') }}.service

while :
do
    curl 127.0.0.1:9080
    if [$? -eq 0]
    then
        break
    fi
done
