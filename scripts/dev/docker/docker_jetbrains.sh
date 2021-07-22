#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs YouTrack, TeamCity and Upsource as Docker containers

echo "Preparing TeamCity and UpSource Docker environments"

# TeamCity directories
echo "Preparing TeamCity volume directories"
mkdir -p "$HOME/projetos/docker/jetbrains/teamcity/datadir"
mkdir -p "$HOME/projetos/docker/jetbrains/teamcity/logs"

# UpSource directories
echo "Preparing UpSource volume directories"
mkdir -p "$HOME/projetos/docker/jetbrains/upsource/data"
mkdir -p "$HOME/projetos/docker/jetbrains/upsource/conf"
mkdir -p "$HOME/projetos/docker/jetbrains/upsource/logs"
mkdir -p "$HOME/projetos/docker/jetbrains/upsource/backups"

echo "Running TeamCity and UpSource Docker containers"
docker create --name teamcity-server  \
    -v "$HOME/projetos/docker/jetbrains/teamcity/datadir":/data/teamcity_server/datadir \
    -v "$HOME/projetos/docker/jetbrains/teamcity/logs":/opt/teamcity/logs  \
    -p 8111:8111 \
    --link mysql:mysql \
    jetbrains/teamcity-server

docker create --name upsource-server \
    -v "$HOME/projetos/docker/jetbrains/upsource/data":/opt/upsource/data \
    -v "$HOME/projetos/docker/jetbrains/upsource/conf":/opt/upsource/conf \
    -v "$HOME/projetos/docker/jetbrains/upsource/logs":/opt/upsource/logs \
    -v "$HOME/projetos/docker/jetbrains/upsource/backups":/opt/upsource/backups \
    -p 9080:8080 \
    --link mysql:mysql \
    jetbrains/upsource:2018.2.1154

docker start teamcity-server
docker start upsource-server
