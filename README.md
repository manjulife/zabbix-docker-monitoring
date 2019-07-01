docker build -f Dockerfile -t zabbix-docker-monitoring .

docker run -it --net=host --privileged --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v /etc/zabbix/zabbix_agentd.d:/etc/zabbix/zabbix_agentd.d --name vm-zabbix-agent -e ZBX_SERVER_HOST="HOST_IP" -e ZBX_DEBUGLEVEL="4" -d zabbix-docker-monitoring:latest


docker run -it --net=host --privileged --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v /etc/zabbix/zabbix_agentd.d:/etc/zabbix/zabbix_agentd.d --name vm-zabbix-agent -e ZBX_SERVER_HOST="192.168.1.47" -e ZBX_DEBUGLEVEL="4" -d zabbix-docker-monitoring:latest


git clone https://github.com/manjulife/zabbix-docker-monitoring.git
Cloning into 'zabbix-docker-monitoring'...
remote: Enumerating objects: 55, done.
remote: Counting objects: 100% (55/55), done.
remote: Compressing objects: 100% (41/41), done.
remote: Total 55 (delta 27), reused 41 (delta 13), pack-reused 0
Unpacking objects: 100% (55/55), done.
bash-4.4# cd zabbix-docker-monitoring/
bash-4.4# mv zabbix-docker-monitoring.sh /etc/zabbix/
bash-4.4# chowm zabbix:zabbix /etc/zabbix/zabbix-docker-monitoring.sh
bash: chowm: command not found
bash-4.4# chown zabbix:zabbix /etc/zabbix/zabbix-docker-monitoring.sh
chmod +x /etc/zabbix/zabbix-docker-monitoring.sh