#! /bin/bash

sudo systemctl stop tentris@{{ item[1].path | replace('/', '-') }}.service
