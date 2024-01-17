FROM solr:8.11.2
COPY ./vivocore /opt/vivocore
COPY ./solr.in.sh /etc/default/solr.in.sh
CMD solr-create -c vivocore -d /opt/vivocore
