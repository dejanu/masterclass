#!/usr/bin/env bash
. $(pack completion)

# delete local nginx
docker rmi nginx:alpine3.18-slim