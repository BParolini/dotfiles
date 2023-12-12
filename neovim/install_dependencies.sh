#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs NeoVIM configuration dependencies

BASEDIR="$(dirname "$(realpath "$0")")"

rm -rf "$HOME/.config/nvim"
ln -sfF "$BASEDIR/config_nvim" "$HOME/.config/nvim"
