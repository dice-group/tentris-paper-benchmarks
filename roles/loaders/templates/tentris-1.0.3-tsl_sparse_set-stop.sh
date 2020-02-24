#! /bin/bash

sudo systemctl stop tentris-1.0.3-tsl_sparse_set@{{ item[1].path | replace('/', '-') }}.service
