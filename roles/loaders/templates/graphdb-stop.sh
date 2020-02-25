#! /bin/bash

sudo systemctl stop graphdb@{{ item[1].name }}.service
