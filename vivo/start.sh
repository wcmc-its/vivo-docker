#!/bin/bash
cd /usr/local/VIVO
mv /usr/local/Vitro/Vitro-1.11.1 /usr/local/VIVO
mv Vitro-1.11.1 Vitro
cd /usr/local/VIVO/VIVO
mvn clean install -Dmaven.test.skip=true -s ../example-settings.xml
cp /usr/local/VIVO/VIVO/runtime.properties /usr/local/VIVO/home/config/
cp /usr/local/VIVO/VIVO/applicationSetup.n3 /usr/local/VIVO/home/config/
cd /usr/local/tomcat/webapps
ln -s vivo ROOT
catalina.sh run

