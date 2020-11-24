#! /bin/sh

java -Xmx{{ iguana_mem }} {{ target_dir }}/iguana-{{ iguana_version }}/corecontroller.jar  $1
