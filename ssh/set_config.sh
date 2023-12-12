#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original SSH configuration file and creates a symlink to the repository one

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$HOME/.ssh/config"
mkdir -p "$HOME/.ssh"
ln -sf "$BASEDIR/.ssh/config" "$HOME/.ssh/config"
