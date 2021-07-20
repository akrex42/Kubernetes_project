FROM alpine:3.12

RUN apk update
RUN apk add wget nginx supervisor
RUN apk --update add \
		php7 \
        php7-bcmath \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-phar \
        php7-posix \
        php7-session \
        php7-soap \
        php7-xml \
        php7-zip \
		php7-mysqli
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin
COPY srcs/phpmyadmin/config.inc.php phpmyadmin
RUN mkdir -p /run/nginx && mkdir -p /phpmyadmin/tmp/
RUN mkdir -p /run/php
COPY srcs/phpmyadmin/supervisord.conf /etc/supervisord.conf
COPY srcs/phpmyadmin/nginx.conf /etc/nginx/nginx.conf
RUN chmod -R 777 /var/lib/nginx/html/*
RUN chmod -R 755 /phpmyadmin/*
EXPOSE 5000
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

