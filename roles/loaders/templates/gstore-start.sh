#! /bin/bash

systemctl start gstore@{{ item[1].name }}.service
