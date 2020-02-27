#! /bin/bash

sudo systemctl stop tentris-{{ item[0] }}@{{ item[1].path | replace('/', '-') }}.service
