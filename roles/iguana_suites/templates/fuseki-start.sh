#! /bin/bash

sudo systemctl start fuseki@{{ item[1].name }}.service

sleep 30
