#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$HOME/.zshenv"
ln -sf "$BASEDIR/zshenv" "$HOME/.zshenv"

mkdir -p "$HOME/.config/zsh/external"
rm -f "$HOME/.zshrc"
ln -sf "$BASEDIR/zshrc" "$HOME/.config/zsh/.zshrc"
ln -sf "$BASEDIR/aliases" "$HOME/.config/zsh/aliases"

