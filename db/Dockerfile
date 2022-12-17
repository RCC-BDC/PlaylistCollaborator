# DB
FROM postgres:latest

USER postgres

ENV POSTGRES_USER=postgres
ENV POSTGRES_DB=db
ENV POSTGRES_PASSWORD=postgres

# Add script(s) to create tables
COPY ./00*.sql /docker-entrypoint-initdb.d/

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432

CMD ["postgres"]