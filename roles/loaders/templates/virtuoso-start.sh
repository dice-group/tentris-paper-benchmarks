#! /bin/bash

sudo systemctl start virtuoso@{{ item[1].name }}.service

sleep 30
