#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs NeoVIM configuration dependencies

BASEDIR=$(dirname $(realpath "$0"))

git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

rm -rf "$HOME/.config/nvim"
ln -sfF "$BASEDIR/config_nvim" "$HOME/.config/nvim"
