#!/usr/bin/env zsh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

if [[ "$OSTYPE" == "linux"* ]]; then
    config_file="$BASEDIR/hosts"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    config_file="$BASEDIR/hosts_olx"
fi

sudo rm -f /etc/hosts
sudo ln -sf "$config_file" /etc/hosts
