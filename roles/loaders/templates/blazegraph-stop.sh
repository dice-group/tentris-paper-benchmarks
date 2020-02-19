#! /bin/bash

sudo systemctl start blazegraph@{{ item[1].name }}.service
