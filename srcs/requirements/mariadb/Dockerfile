FROM alpine:3.15.5
RUN apk update && apk -U upgrade
RUN apk add --no-cache bash vim\
    && apk add --no-cache openrc \
    && apk add --no-cache mariadb mariadb-client mariadb-server-utils mariadb-common \
    && apk add --no-cache mysql mysql-client \
    && rm -f /var/cache/apk/*
RUN rm -f /etc/my.cnf \
        /etc/mysql/my.cnf \
        ~/my.cnf
RUN mkdir -p /var/lib/mysql /run/mysqld
RUN	chown -R mysql /var/lib/mysql
RUN	chmod 777 /var/lib/mysql
COPY conf/my.cnf /etc/my.cnf
COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/my.cnf ~/my.cnf
COPY conf/mariadb_entrypoint.sh /tmp/mariadb_entrypoint.sh
RUN chmod +x /tmp/mariadb_entrypoint.sh

ENTRYPOINT ["sh", "/tmp/mariadb_entrypoint.sh"]