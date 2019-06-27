FROM zabbix/zabbix-agent:alpine-4.2-latest

ENV ZABBIX_VERSION=release/4.2

WORKDIR /root

RUN apk add --update \
    curl \
    jq \
    git \
    && rm -rf /var/cache/apk/*

RUN adduser -S docker -D && \
    sed -i "s/999/99/" /etc/group && \
    addgroup -g 999 docker && \
    adduser zabbix docker && \
    adduser docker docker

#RUN addgroup docker --gid 990 && adduser ${USERNAME} docker

#RUN addgroup docker --gid 990 && adduser root docker
#RUN addgroup docker --gid 990 && adduser zabbix docker