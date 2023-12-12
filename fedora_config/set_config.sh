#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

sudo rm -f /etc/dnf/dnf.conf
sudo ln -sf "$BASEDIR/dnf.conf" /etc/dnf/dnf.conf
