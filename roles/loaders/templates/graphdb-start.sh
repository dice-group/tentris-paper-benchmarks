#! /bin/bash

systemctl start graphdb@{{ item[1].name }}.service

sleep 30
