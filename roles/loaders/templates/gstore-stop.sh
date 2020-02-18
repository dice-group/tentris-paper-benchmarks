#! /bin/bash

systemctl stop gstore@{{ item[1].name }}.service
