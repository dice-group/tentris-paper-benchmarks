#! /bin/bash

systemctl start tentris@{{ item[1].path | replace('/', '-') }}.service
