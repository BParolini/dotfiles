#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs NeoVIM configuration dependencies

BASEDIR="$(dirname "$(realpath "$0")")"

git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
git clone --depth 1 git@github.com:eclipse/eclipse.jdt.ls.git "$HOME/.jdtls"
go install github.com/go-delve/delve/cmd/dlv@latest

rm -rf "$HOME/.config/nvim"
ln -sfF "$BASEDIR/config_nvim" "$HOME/.config/nvim"
