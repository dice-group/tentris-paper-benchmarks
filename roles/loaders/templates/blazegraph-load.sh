#! /bin/bash

sudo -u blazegraph mkdir -p {{ database_base_dir }}/blazegraph/{{ item[1].name }}

sudo cgmemtime sudo -u blazegraph bash -c "cd {{ database_base_dir }}/blazegraph/{{ item[1].name }} && java -cp /opt/blazegraph/blazegraph.jar com.bigdata.rdf.store.DataLoader /opt/blazegraph/application.properties {{ item[1].path }}"