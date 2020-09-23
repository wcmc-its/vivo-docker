#!/bin/bash
cd /usr/local/VIVO/VIVO-1.11.1
mvn install -Dmaven.test.skip=true -s ../example-settings.xml
cp /usr/local/VIVO/VIVO-1.11.1/runtime.properties /usr/local/VIVO/home/config/
cp /usr/local/VIVO/VIVO-1.11.1/applicationSetup.n3 /usr/local/VIVO/home/config/
cd /usr/local/tomcat/webapps
ln -s vivo ROOT
catalina.sh run

