FROM tomcat:9.0.21-jdk11-openjdk

RUN apt-get update
RUN apt-get install -y maven git

WORKDIR /usr/local/

ENV VITRO_VERSION 1.11.1
RUN wget -O Vitro.zip https://github.com/wcmc-its/Vitro/releases/download/${VITRO_VERSION}/vitro-${VITRO_VERSION}.zip
RUN unzip Vitro.zip -d Vitro
RUN rm Vitro.zip

ENV VIVO_VERSION 1.11.1
RUN wget -O VIVO.zip https://github.com/wcmc-its/VIVO/releases/download/${VIVO_VERSION}/VIVO-${VIVO_VERSION}.zip
RUN unzip VIVO.zip -d VIVO
RUN rm VIVO.zip

WORKDIR /usr/local/VIVO/
COPY ./example-settings.xml example-settings.xml
WORKDIR /usr/local/VIVO/VIVO-1.11.1
RUN mvn install -s ../example-settings.xml

# clean up
RUN rm -r /usr/local/tomcat/webapps/docs
RUN rm -r /usr/local/tomcat/webapps/examples

# Set properties
# Adjust logging, you can mount over this in docker-compose to further adjust
COPY ./log4j.properties /usr/local/tomcat/webapps/VIVO/WEB-INF/classes

WORKDIR /usr/local/VIVO/home/config

COPY ./example.runtime.properties /usr/local/VIVO/home/config/runtime.properties
COPY ./example.applicationSetup.n3 /usr/local/VIVO/home/config/applicationSetup.n3

RUN chmod ugo+w -R /usr/local/tomcat/temp
RUN chmod ugo+w -R /usr/local/VIVO/home

RUN export CATALINA_OPTS="-Xms512m -Xmx512m -XX:MaxPermSize=128m"

RUN ln -sf /dev/stdout /usr/local/tomcat/logs/vivo.all.log
