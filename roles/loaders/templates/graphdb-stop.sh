#! /bin/bash

systemctl stop fuseki@{{ item[1].name }}.service
