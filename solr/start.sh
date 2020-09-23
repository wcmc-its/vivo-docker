#!/bin/bash
cp -rf /opt/vivocore/* /var/solr/data/vivocore/
solr-create -c vivocore -d /opt/vivocore