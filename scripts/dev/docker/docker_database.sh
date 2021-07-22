#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs MySQL and PostgreSQL into Docker and runs them

echo "Preparing MySQL and Mongo Docker volumes' directories"
mkdir -p "$HOME/docker/docker_local_databases/mysql"
mkdir -p "$HOME/docker/docker_local_databases/mongo"
mkdir -p "$HOME/docker/docker_local_databases/postgres"

echo
echo "Running MySQL and Mongo Docker containers"
docker run -d --restart always --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=db-password -v "$HOME/docker/docker_local_databases/mysql":/var/lib/mysql mysql:latest

docker run -d --restart always --name mongo -v "$HOME/docker/docker_local_databases/mongo":/data/db -p 27017:27017 -p 28017:28017 mongo:latest

docker run -d --restart always --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=db-passord -v "$HOME/docker/docker_local_databases/postgres":/var/lib/pgsql/data postgres:latest
