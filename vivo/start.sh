#!/bin/bash
cd /usr/local/VIVO
mv /usr/local/Vitro/Vitro-vivo-rel-1.9.0 /usr/local/VIVO
mv Vitro-vivo-rel-1.9.0 Vitro
cd /usr/local/VIVO/VIVO
mvn clean install -Dmaven.test.skip=true -s ../example-settings.xml
cp /usr/local/VIVO/VIVO/runtime.properties /usr/local/VIVO/home/
cp /usr/local/VIVO/VIVO/applicationSetup.n3 /usr/local/VIVO/home/config/
cd /usr/local/tomcat/webapps
rm -rf /usr/local/VIVO/webapps/vivosolr
ln -s /usr/local/VIVO/webapps/vivo ROOT
catalina.sh run

