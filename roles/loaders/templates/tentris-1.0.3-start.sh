#! /bin/bash

sudo systemctl start tentris-1.0.3@{{ item[1].path | replace('/', '-') }}.service

sleep 30
