FROM alpine:3.12

RUN apk update
RUN apk add mysql mysql-client openrc supervisor \
    && mkdir -p /run/mysqld
RUN rc-update
COPY srcs/mysql/script.sh /
COPY srcs/mysql/supervisord.conf /etc/supervisord.conf
COPY srcs/mysql/my.cnf /etc/
VOLUME ["/var/lib/mysql"]
COPY srcs/mysql/wordpress.sql /
VOLUME ["/sys/fs/cgroup"]
RUN chown -R mysql /run/mysqld
EXPOSE 3306
CMD sh script.sh