FROM alpine:3.12

RUN apk update
RUN apk add nginx openssl supervisor
RUN mkdir -p /run/nginx
COPY srcs/nginx/nginx.conf /etc/nginx/nginx.conf
COPY srcs/nginx/supervisord.conf /etc/supervisord.conf
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=school21/OU=students/emailAddress=polina.s.nekrasova@gmail.com/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt
RUN chmod -R 777 /var/lib/nginx/html/*
EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
