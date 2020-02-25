#! /bin/sh

sudo -u iguana bash -c "cd /var/lib/iguana; java -cp /opt/iguana-{{ iguana_version }}/corecontroller.jar org.aksw.iguana.cc.controller.MainController $1"