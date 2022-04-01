#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Prunes all Docker images, containers, volumes, etc.

echo "Pruning containers"
docker container prune --force

echo
echo "Pruning images"
docker image prune -a --force

echo
echo "Pruning volumes"
docker volume prune --force

echo
echo "Pruning builder cache"
docker builder prune --force
