#!/bin/bash
cp -rf /usr/local/solr/* /usr/vivo/solr/
solr-create -c vivocore -d /usr/vivo/solr