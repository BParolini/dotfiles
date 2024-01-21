#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$XDG_CONFIG_HOME/i3/config"
mkdir -p "$XDG_CONFIG_HOME/i3"
ln -sf "$BASEDIR/i3.config" "$XDG_CONFIG_HOME/i3/config"

rm -f "$HOME/.config/plasma-workspace/env"
ln -sf "$BASEDIR/plasma_env.sh" "$HOME/.config/plasma-workspace/env"
