#! /bin/bash

sudo systemctl stop tentris-1.0.3@{{ item[1].path | replace('/', '-') }}.service
