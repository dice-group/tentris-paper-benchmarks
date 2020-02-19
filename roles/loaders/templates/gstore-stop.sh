#! /bin/bash

sudo systemctl stop gstore@{{ item[1].name }}.service
