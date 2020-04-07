#! /bin/sh

java -Xmx{{ iguana_mem }} -cp {{ target_dir }}/iguana-{{ iguana_version }}/corecontroller.jar org.aksw.iguana.cc.controller.MainController $1