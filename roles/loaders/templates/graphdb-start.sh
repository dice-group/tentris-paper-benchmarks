#! /bin/bash

sudo systemctl start graphdb@{{ item[1].name }}.service

sleep 30
