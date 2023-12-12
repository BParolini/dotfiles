#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

sudo rm -f /etc/hosts
sudo ln -sf "$BASEDIR/hosts" /etc/hosts
