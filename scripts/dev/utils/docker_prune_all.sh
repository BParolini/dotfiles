#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Prunes all Docker images, containers, volumes, etc.

docker container prune --force
docker image prune -a --force
docker volume prune --force
docker builder prune --force
