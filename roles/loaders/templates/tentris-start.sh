#! /bin/bash

sudo systemctl start tentris@{{ item[1].path | replace('/', '-') }}.service

sleep 30
