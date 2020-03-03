#! /bin/bash

sudo -u gstore mkdir -p {{ database_base_dir }}/gstore/{{ item[1].name }}
sudo -u gstore mkdir -p {{ database_base_dir }}/gstore/{{ item[1].name }}/.tmp
sudo -u gstore mkdir -p {{ database_base_dir }}/gstore/{{ item[1].name }}/logs/endpoint

sudo -u gstore cp -r /opt/gstore/data {{ database_base_dir }}/gstore/{{ item[1].name }}
sudo -u gstore cp -r /opt/gstore/Server {{ database_base_dir }}/gstore/{{ item[1].name }}


sudo cgmemtime sudo -u gstore bash -c "cd {{ database_base_dir }}/gstore/{{ item[1].name }} && /opt/gstore/bin/ginit && time /opt/gstore/bin/gbuild {{ item[1].name }} {{ item[1].path }}" 2>&1 | tee gstore-load-{{ item[1].name }}.log
