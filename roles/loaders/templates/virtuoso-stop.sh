#! /bin/bash

systemctl stop virtuoso@{{ item[1].name }}.service
