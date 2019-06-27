FROM zabbix/zabbix-agent:alpine-4.2-latest

ENV ZABBIX_VERSION=release/4.2

WORKDIR /root

RUN apk add --update \
    curl \
    jq \
    && rm -rf /var/cache/apk/*

#RUN addgroup docker --gid 990 && adduser root docker
#RUN addgroup docker --gid 990 && adduser zabbix docker