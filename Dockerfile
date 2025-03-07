FROM postgrest/postgrest

USER root
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
USER ubuntu

ENTRYPOINT ["docker-entrypoint.sh"]
