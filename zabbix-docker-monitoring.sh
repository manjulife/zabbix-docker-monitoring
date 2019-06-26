#!/bin/bash 
containerID=$(curl -s --unix-socket /var/run/docker.sock http:/localhost/containers/json?all=1 | jq -r ".[] | select(.Names[0]==\"/heuristic_engelbart\") | .Id")
echo "containerID: $containerID"
containerState=$(curl -s --unix-socket /var/run/docker.sock http:/localhost/containers/$containerID/json | jq -r .State.Status )
echo "state: $containerState"

#for name in $namesContainer; do
#  name=${name:1}
  
#  echo "container: - $name "
#done