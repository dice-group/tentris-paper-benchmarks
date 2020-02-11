#! /bin/sh

java -cp /opt/iguana-{{ iguana_version.version_number }}/corecontroller.jar org.aksw.iguana.cc.config.ConfigSender localhost $1