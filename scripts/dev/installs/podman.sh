#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Podman

echo "Installing podman"
dnf install -y podman podman-compose podman-plugins buildah
