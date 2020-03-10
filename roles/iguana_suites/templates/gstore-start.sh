#! /bin/bash

# TODO: gStore does not start

sudo systemctl start gstore@{{ item[1].name }}.service

sleep 30
