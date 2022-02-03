#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Adds Docker repository, installs Docker and enables Docker service

echo "Enabling Docker Community Edition Fedora repository"
dnf config-manager -yb --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

echo "Installing Docker CE and Docker Compose"
dnf install -yb docker-ce docker-compose

echo "Adding bparolini to linux's docker user group"
usermod -a -G docker bparolini

echo "Enabling and starting Docker service"
systemctl enable docker
systemctl start docker
