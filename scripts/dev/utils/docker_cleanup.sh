#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Clean docker environment

echo "docker rm $(docker ps -qa)"
docker rm "$(docker ps -qa)"

echo
echo "docker volume rm $(docker volume ls -qf dangling=true)"
docker volume rm "$(docker volume ls -qf dangling=true)"

echo
echo "docker network rm $(docker network ls -q)"
docker network rm "$(docker network ls -q)"

echo
echo "docker rmi $(docker images -q)"
docker rmi "$(docker images -q)"
