docker build -f Dockerfile -t zabbix-docker-monitoring .

docker run -it --net=host --privileged --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v /etc/zabbix/zabbix_agentd.d:/etc/zabbix/zabbix_agentd.d --name vm-zabbix-agent -e ZBX_SERVER_HOST="HOST_IP" -e ZBX_DEBUGLEVEL="4" -d zabbix-docker-monitoring:latest