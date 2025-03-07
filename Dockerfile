FROM ubuntu:latest

COPY --from=postgrest/postgrest /bin/postgrest /bin

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
