#! /bin/bash

sudo systemctl stop fuseki@{{ item[1].name }}.service
