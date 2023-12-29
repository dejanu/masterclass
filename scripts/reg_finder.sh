#!/bin/bash


# Quickly assess docker images using docker scan and Docker Official images
${IMAGE_NAME}=nginx

# find the current registry
# defaults to Registry: https://index.docker.io/v1/
# index.docker.io hosts the Docker implementation by DockerHub.
docker info

# # get token to be able to talk to Docker Hub
# TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${DUSER}'", "password": "'${DPASS}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)
# curl -s -H "Authorization: Bearer ${TOKEN}" https://hub.docker.com/v2/repositories/${DUSER}/?page_size=10000 

# hub.docker.com hosts the rich DockerHub specific APIs.
curl -s https://hub.docker.com/v2/namespaces/library/repositories/${IMAGE_NAME}/tags/?page_size=10000 | jq -r '.results|.[]|.name'


docker scout quickview ${IMAGE_NAME}