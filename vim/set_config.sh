#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$HOME/.vimrc"
rm -f "$HOME/.ideavimrc"
ln -sf "$BASEDIR/vimrc" "$HOME/.vimrc"
ln -sf "$BASEDIR/vimrc" "$HOME/.ideavimrc"
