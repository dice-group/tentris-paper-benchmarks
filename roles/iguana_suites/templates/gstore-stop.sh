#! /bin/bash

sudo systemctl stop gstore@{{ item.name }}.service
