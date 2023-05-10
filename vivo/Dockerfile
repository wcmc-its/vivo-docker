FROM tomcat:9.0.21-jdk11-openjdk

RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y maven git

WORKDIR /usr/local/

ENV VITRO_VERSION 1.11.1
RUN wget -O Vitro.zip https://github.com/wcmc-its/Vitro/archive/master.zip
RUN unzip Vitro.zip -d Vitro
RUN rm Vitro.zip

ENV VIVO_VERSION 1.11.1
RUN wget -O VIVO.zip https://github.com/wcmc-its/VIVO/archive/prod.zip
RUN unzip VIVO.zip -d VIVO
RUN rm VIVO.zip

WORKDIR /usr/local/VIVO/
COPY ./example-settings.xml example-settings.xml
RUN mv VIVO-master VIVO
WORKDIR /usr/local/VIVO/VIVO

# clean up
RUN rm -r /usr/local/tomcat/webapps/docs
RUN rm -r /usr/local/tomcat/webapps/examples
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN rm -rf /usr/local/tomcat/webapps/manager
RUN rm -rf /usr/local/tomcat/webapps/host-manager

# Set properties
# Adjust logging, you can mount over this in docker-compose to further adjust
#COPY ./log4j.properties /usr/local/tomcat/webapps/vivo/WEB-INF/classes

COPY ./example.runtime.properties /usr/local/VIVO/VIVO/runtime.properties
COPY ./example.applicationSetup.n3 /usr/local/VIVO/VIVO/applicationSetup.n3

# Newrelic section
ENV NEW_RELIC_APP_NAME="VIVO Dev"
ENV NEW_RELIC_LICENSE_KEY="NR_LICENSE_KEY"
RUN mkdir -p /usr/local/tomcat/newrelic
ADD ./newrelic/newrelic.jar /usr/local/tomcat/newrelic/newrelic.jar
ENV JAVA_OPTS="$JAVA_OPTS -javaagent:/usr/local/tomcat/newrelic/newrelic.jar"
ADD ./newrelic/newrelic.yml /usr/local/tomcat/newrelic/newrelic.yml
ADD ./server.xml /usr/local/tomcat/conf/server.xml

RUN chmod ugo+w -R /usr/local/tomcat/temp
#RUN chmod ugo+w -R /usr/local/VIVO/home

RUN ln -sf /dev/stdout /usr/local/tomcat/logs/vivo.all.log

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
