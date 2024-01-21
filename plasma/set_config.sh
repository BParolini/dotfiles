#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$HOME/.config/plasma-workspace/env"
ln -sf "$BASEDIR/plasma_env.sh" "$HOME/.config/plasma-workspace/env"
