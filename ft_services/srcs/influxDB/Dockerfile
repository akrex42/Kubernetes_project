FROM alpine:3.12

RUN apk update
RUN apk add openrc influxdb
COPY srcs/influxdb/influxdb.conf /etc/influxdb/
EXPOSE 8086
CMD influxd