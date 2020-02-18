#! /bin/bash

systemctl stop tentris@{{ item[1].path | replace('/', '-') }}.service
