#!/usr/bin/env bash

docker run -d -p 5000:5000 --name registry registry:2
docker image tag alpine:latest localhost:5000/demoalpine
docker push localhost:5000/demoalpine

# retag and push image and just check from browser ;)
http://127.0.0.1:5000/v2/_catalog

