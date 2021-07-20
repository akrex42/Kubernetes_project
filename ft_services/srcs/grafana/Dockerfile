FROM alpine:3.12

EXPOSE 3000
RUN apk update
RUN apk add openrc
ADD https://dl.grafana.com/oss/release/grafana-6.7.1.linux-amd64.tar.gz .
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk
RUN addgroup grafana && \
    adduser -s /bin/false -G grafana -S -D grafana
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel
RUN rc-update
RUN tar -C . -xzf grafana-6.7.1.linux-amd64.tar.gz
COPY srcs/grafana/start.sh /
COPY srcs/grafana/custom.ini /grafana-6.7.1/conf/
COPY srcs/grafana/dashboards/* /grafana-6.7.1/public/dashboards/
COPY srcs/grafana/datasources.yaml /grafana-6.7.1/conf/provisioning/datasources/
COPY srcs/grafana/dashboards.yaml /grafana-6.7.1/conf/provisioning/dashboards/
RUN chmod 755 start.sh
CMD sh start.sh