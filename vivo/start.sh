#!/bin/bash
cd /usr/local/VIVO
mv /usr/local/Vitro/Vitro-master /usr/local/VIVO
mv Vitro-master Vitro
cd /usr/local/VIVO/VIVO
mvn clean install -Dmaven.test.skip=true -s ../example-settings.xml
cp /usr/local/VIVO/VIVO/runtime.properties /usr/local/VIVO/home/config/
cp /usr/local/VIVO/VIVO/applicationSetup.n3 /usr/local/VIVO/home/config/
cd /usr/local/tomcat/webapps
ln -s /usr/local/VIVO/webapps/vivo ROOT
echo "export CATALINA_OPTS="'"-Xms8192m -Xmx8192m -XX:MaxPermSize=2048m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/usr/local/VIVO"'"" > /usr/local/tomcat/bin/setenv.sh
catalina.sh run

