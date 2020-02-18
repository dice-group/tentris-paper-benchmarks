#! /bin/bash

systemctl start fuseki@{{ item[1].name }}.service
