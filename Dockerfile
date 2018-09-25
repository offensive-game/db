FROM postgres:11-alpine
LABEL maintainer="Djordje Vukovic"

COPY scripts/create-db.sql /scripts/create-db.sql
COPY init/init-db.sh /docker-entrypoint-initdb.d/init-db.sh
