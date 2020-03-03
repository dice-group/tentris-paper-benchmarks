#! /bin/bash

sudo -u rdf3x mkdir -p {{ database_base_dir }}/rdf3x/{{ item[1].name }}

sudo cgmemtime sudo -u rdf3x /opt/rdf3x/rdf3xload {{ database_base_dir }}/rdf3x/{{ item[1].name }}/db {{ item[1].path }}