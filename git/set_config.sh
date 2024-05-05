#!/usr/bin/env zsh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration file and creates a symlink to the repository one

BASEDIR="$(dirname "$(realpath "$0")")"

if [[ "$OSTYPE" == "linux"* ]]; then
    config_file="$BASEDIR/gitconfig"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    config_file="$BASEDIR/gitconfig_olxbr"
fi

rm -f "$HOME/.gitconfig"
ln -sf "$config_file" "$HOME/.gitconfig"
