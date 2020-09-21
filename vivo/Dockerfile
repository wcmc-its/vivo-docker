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
RUN mkdir -p tomcat-certs
RUN openssl req -x509 -nodes -days 3650 \
    -subj  "/C=US/ST=NY/O=WCM ITS/CN=localhost" \
     -newkey rsa:2048 -keyout /usr/local/tomcat-certs/selfsigned-key.pem \
     -out /usr/local/tomcat-certs/selfsigned-cert.pem;
WORKDIR /usr/local/tomcat/conf/
RUN rm -rf /usr/local/tomcat/conf/server.xml
COPY ./server.xml .

WORKDIR /usr/local/VIVO/
COPY ./example-settings.xml example-settings.xml
WORKDIR /usr/local/VIVO/VIVO-1.11.1

# clean up
RUN rm -r /usr/local/tomcat/webapps/docs
RUN rm -r /usr/local/tomcat/webapps/examples

# Set properties
# Adjust logging, you can mount over this in docker-compose to further adjust
COPY ./log4j.properties /usr/local/tomcat/webapps/VIVO/WEB-INF/classes

COPY ./example.runtime.properties /usr/local/VIVO/VIVO-1.11.1/runtime.properties
COPY ./example.applicationSetup.n3 /usr/local/VIVO/VIVO-1.11.1/applicationSetup.n3

RUN chmod ugo+w -R /usr/local/tomcat/temp
#RUN chmod ugo+w -R /usr/local/VIVO/home

RUN export CATALINA_OPTS="-Xms4096m -Xmx4096m -XX:MaxPermSize=512m"

RUN ln -sf /dev/stdout /usr/local/tomcat/logs/vivo.all.log

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
