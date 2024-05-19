#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$HOME/.zshenv"
ln -sf "$BASEDIR/zshenv" "$HOME/.zshenv"

rm -f "$HOME/.zshrc"
ln -sf "$BASEDIR/zshrc" "$HOME/.config/zsh/.zshrc"
ln -sf "$BASEDIR/aliases" "$HOME/.config/zsh/aliases"
ln -sf "$BASEDIR/dev_env" "$HOME/.config/zsh/dev_env"
ln -sf "$BASEDIR/xdg_defaults" "$HOME/.config/zsh/xdg_defaults"

