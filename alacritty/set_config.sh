#!/usr/bin/env zsh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

if [[ "$OSTYPE" == "linux"* ]]; then
    config_file="$BASEDIR/alacritty.toml"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    config_file="$BASEDIR/alacritty_mac.toml"
fi

rm -f "$XDG_CONFIG_HOME/alacritty/alacritty.toml"
mkdir -p "$XDG_CONFIG_HOME/alacritty"
ln -sf "$config_file" "$XDG_CONFIG_HOME/alacritty/alacritty.toml"
