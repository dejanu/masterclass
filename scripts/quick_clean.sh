#!/usr/bin/env bash

# delete local nginx
docker rmi nginx:alpine3.18-slim

docker rm -f $(docker ps -aq -f  status=exited)
docker rmi -f $(docker images -aq)
docker image prune -a