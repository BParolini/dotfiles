#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$XDG_CONFIG_HOME/alacritty/alacritty.toml"
mkdir -p "$XDG_CONFIG_HOME/alacritty"
ln -sf "$BASEDIR/alacritty.toml" "$XDG_CONFIG_HOME/alacritty/alacritty.toml"
