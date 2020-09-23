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

# clean up
RUN rm -r /usr/local/tomcat/webapps/docs
RUN rm -r /usr/local/tomcat/webapps/examples
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Set properties
# Adjust logging, you can mount over this in docker-compose to further adjust
COPY ./log4j.properties /usr/local/tomcat/webapps/VIVO/WEB-INF/classes

COPY ./example.runtime.properties /usr/local/VIVO/VIVO-1.11.1/runtime.properties
COPY ./example.applicationSetup.n3 /usr/local/VIVO/VIVO-1.11.1/applicationSetup.n3

RUN chmod ugo+w -R /usr/local/tomcat/temp
#RUN chmod ugo+w -R /usr/local/VIVO/home

RUN export CATALINA_OPTS="-Xms2048m -Xmx2048m -XX:MaxPermSize=128m"

RUN ln -sf /dev/stdout /usr/local/tomcat/logs/vivo.all.log

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
