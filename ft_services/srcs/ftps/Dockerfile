FROM alpine:3.12

RUN apk update
RUN apk add openrc vsftpd openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=school21/OU=students/emailAddress=polina.s.nekrasova@gmail.com/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/ftps-selfsigned.key -out /etc/ssl/ftps-selfsigned.crt
RUN adduser -D -h /var/ftp admin && echo "admin:admin" | chpasswd
RUN mkdir -p /var/ftp
COPY srcs/ftps/start.sh /
COPY srcs/ftps/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/ftps/sample.txt /var/ftp/files/
RUN chown admin /var/ftp/files
RUN chmod 777 /var/ftp/files
EXPOSE 21 20 64000
CMD sh start.sh