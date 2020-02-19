#! /bin/bash

sudo systemctl stop blazegraph@{{ item[1].name }}.service
