#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Symlinks fonts to environment

BASEDIR="$(dirname "$(realpath "$0")")"

rm -rf "$XDG_DATA_HOME/fonts"
ln -sf "$BASEDIR" "$XDG_DATA_HOME/fonts"
