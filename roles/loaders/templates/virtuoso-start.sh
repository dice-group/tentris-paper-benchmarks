#! /bin/bash

systemctl start virtuoso@{{ item[1].name }}.service
