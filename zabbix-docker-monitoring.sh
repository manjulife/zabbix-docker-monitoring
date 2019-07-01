#!/bin/bash
containerName=$1
#metricaName=$2
#isDebug=$3

#if echo "$metricaName"

#if [ "$metricaName" == "status" ]
#then
#elif [ "$metricaName" == "disk" ]

containerID=$(curl -s --unix-socket /var/run/docker.sock http:/localhost/containers/json?all=1 | jq -r ".[] | select(.Names[0]==\"/$containerName\") | .Id")
#echo "containerID: $containerID"
containerState=$(curl -s --unix-socket /var/run/docker.sock http:/localhost/containers/$containerID/json | jq -r .State.Status )
#echo "state: $containerState"

if [ "running" == "$containerState" ]
then
    echo "1"
elif [ "exited" == "$containerState" ]
then
    echo "2"
else
    echo "0"
fi

#   created 
#   running
#   restarting
#   removing
#   exited
#   paused
#   dead

