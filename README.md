docker build -f Dockerfile -t zabbix-docker-monitoring .

docker run -it --net=host --privileged --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v /etc/zabbix/zabbix_agentd.d:/etc/zabbix/zabbix_agentd.d --name vm-zabbix-agent -e ZBX_SERVER_HOST="HOST_IP" -e ZBX_DEBUGLEVEL="4" -d zabbix-docker-monitoring:latest


docker run -it --net=host --privileged --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v /etc/zabbix/zabbix_agentd.d:/etc/zabbix/zabbix_agentd.d --name vm-zabbix-agent -e ZBX_SERVER_HOST="192.168.1.47" -e ZBX_DEBUGLEVEL="4" -d zabbix-docker-monitoring:latest


git clone https://github.com/manjulife/zabbix-docker-monitoring.git

cd zabbix-docker-monitoring/
mv zabbix-docker-monitoring.sh /etc/zabbix/
chown zabbix:zabbix /etc/zabbix/zabbix-docker-monitoring.sh
chmod +x /etc/zabbix/zabbix-docker-monitoring.sh