#! /bin/bash

sudo cgmemtime sudo -u tentris /opt/tentris/{{ item[0] }}/tentris_terminal -f {{ item[1].path }} << EOF 2>&1 | tee tentris-{{ item[0] }}-load-{{ item[1].name }}.log
EOF