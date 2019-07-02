#!/bin/bash
paramCName=$1
paramDebug=$2

if [ -n "$paramDebug" ] && [ "$paramDebug" -eq 1 ]
then
   isDebug=1
else
   isDebug=0
fi

function container_status {

    argCName=$1
    argIsDebug=$2

    if [ "$argIsDebug" -eq 1 ]
    then
       echo "containerName: $argCName"
    fi

    containerID=$(curl -s --unix-socket /var/run/docker.sock http:/localhost/containers/json?all=1 | jq -r ".[] | select(.Names[0]==\"/$argCName\") | .Id")
    if [ "$argIsDebug" -eq 1 ]
    then
       echo "containerID: $containerID"
    fi

    containerState=$(curl -s --unix-socket /var/run/docker.sock http:/localhost/containers/$containerID/json | jq -r .State.Status )
    if [ "$argIsDebug" -eq 1 ]
    then
       echo "state: $containerState"
    fi
    # result
    if [ "running" == "$containerState" ]
    then
        echo "5"
    elif [ "exited" == "$containerState" ]
    then
        echo "1"
    else
        # other result
        echo "0"
    fi
}

container_status "$paramCName" "$isDebug"

#   created 
#   running
#   restarting
#   removing
#   exited
#   paused
#   dead