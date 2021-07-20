FROM alpine:3.12

RUN apk update
RUN apk add wget nginx openssl supervisor
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
RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php
COPY srcs/wordpress/nginx.conf /etc/nginx/nginx.conf
COPY srcs/wordpress/supervisord.conf /etc/supervisord.conf
RUN chmod -R 777 /var/lib/nginx/html/*
WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY srcs/wordpress/wp-config.php /var/www/wordpress/
RUN chmod -R 777 /var/www/*
EXPOSE 5050
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
