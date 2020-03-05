#! /bin/bash

mkdir -p databases/blazegraph/{{ item[1].name }}

cgmemtime java -cp /opt/blazegraph/blazegraph.jar -Dcom.bigdata.journal.AbstractJournal.tmpDir=./ com.bigdata.rdf.store.DataLoader /opt/blazegraph/application.properties {{ item[1].path }} 2>&1 | tee blazegraph-load-{{ item[1].name }}.log