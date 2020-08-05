#! /bin/bash

{{ target_dir }}/triplestores/gstore/bin/shutdown 9000

killall ghttp

rm {{ target_dir }}/gstore.pid
