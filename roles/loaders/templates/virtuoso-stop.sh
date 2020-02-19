#! /bin/bash

sudo systemctl stop virtuoso@{{ item[1].name }}.service
