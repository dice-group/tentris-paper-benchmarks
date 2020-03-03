#! /bin/bash

sudo cgmemtime sudo -u tentris /opt/tentris/{{ item[0] }}/tentris_terminal -f {{ item[1].path }} << EOF
EOF 2>&1 | tee tentris-load-{{ item[1].name }}.log