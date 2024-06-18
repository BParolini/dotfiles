#!/usr/bin/env zsh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Runs GNU Stow

BASEDIR="$(dirname "$(realpath "$0")")"

packages=(
    zsh
    vim
    tmux
    ssh
    aws
    )

# Run GNU stow in all repo packages
for p in "${packages[@]}"; do
    stow -d "$BASEDIR" -t "$HOME" --dotfiles "$p"
done

# Installs brew only if in MacOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ ! $commands[brew] ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    rm -f ~/Brewfile
    stow -d "$BASEDIR" brew
    brew bundle install
fi
