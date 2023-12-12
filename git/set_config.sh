#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration file and creates a symlink to the repository one

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$HOME/.gitconfig"
ln -sf "$BASEDIR/gitconfig" "$HOME/.gitconfig"
