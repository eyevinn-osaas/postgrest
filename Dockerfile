FROM postgrest/postgrest

USER 0
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
USER ubuntu

ENTRYPOINT ["docker-entrypoint.sh"]
