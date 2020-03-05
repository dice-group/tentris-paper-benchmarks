#! /bin/bash

sudo systemctl start gstore@{{ item[1].name }}.service

sleep 30
