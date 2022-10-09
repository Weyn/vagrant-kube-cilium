#!/bin/bash
x=1
while [ $x -le 10 ]
do
  crictl pull ratelimitpreview/test:latest
  sleep 1s
  crictl rmi docker.io/ratelimitpreview/test
  x=$(( $x + 1 ))
done

TOKEN=$(curl --user 'USERNAME:PASSWORD' "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
curl --head -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest