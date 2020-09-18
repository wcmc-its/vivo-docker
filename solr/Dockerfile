FROM solr:latest
USER solr
COPY ./vivocore /usr/local/solr
USER root
RUN mkdir -p /usr/vivo/solr
RUN chmod -R 777 /usr/vivo/solr
RUN chown solr:solr /usr/vivo/solr
ADD start.sh /
RUN chmod +x /start.sh
USER solr
CMD ["/start.sh"]
