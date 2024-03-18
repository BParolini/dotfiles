#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Install Homebrew and apps from Brewfile

BASEDIR="$(dirname "$(realpath "$0")")"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

rm -f ~/Brewfile
ln -s "$BASEDIR/Brewfile" ~/Brewfile
brew bundle install
