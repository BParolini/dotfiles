#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs various games

dnf install -y wesnoth wesnoth-data wesnoth-server wesnoth-tools \
               0ad 0ad-data \
               openttd \
               smc smc-music \
               astromenace

BASEDIR=$(dirname "$0")

source "$BASEDIR/emulators.sh"
