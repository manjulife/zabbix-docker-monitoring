#!/bin/bash 
namesContainer=$(curl -s --unix-socket /var/run/docker.sock http:/localhost/containers/json | jq -r ".[] | .Names[0]")

for name in $namesContainer; do
  name=${name:1}
  echo "container: - $name "
done