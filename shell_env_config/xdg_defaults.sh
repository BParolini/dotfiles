#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Defines default XDG environment variables.

export XDG_DATA_HOME="${XDG_DATA_HOME:="$HOME/.local/share"}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME/.config"}"
export XDG_STATE_HOME="${XDG_STATE_HOME:="$HOME/.local/state"}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:="/usr/local/share:/usr/share"}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:="$HOME/.config/kdedefaults:/etc/xdg/xdg-plasma:/etc/xdg"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:="$HOME/.cache"}"
