#! /bin/bash

systemctl start blazegraph@{{ item[1].name }}.service
