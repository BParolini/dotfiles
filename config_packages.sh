#!/usr/bin/env zsh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Runs GNU Stow

BASEDIR="$(dirname "$(realpath "$0")")"

packages=(
    "zsh"
    "vim"
    "tmux"
    "ssh"
    "aws"
    )

# Run GNU stow in all repo packages
for p in "${packages[@]}"; do
    stow -d "$BASEDIR" -t "$HOME" --dotfiles "$p"
done

source ./neovim/config_nvim.sh

# Installs brew only if in MacOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ ! $commands[brew] ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    rm -f ~/Brewfile
    stow -d "$BASEDIR" brew
    brew bundle install --file ~/Brewfile

    stow -d "$BASEDIR" -t "$HOME" --dotfiles alacritty-mac
else
    stow -d "$BASEDIR" -t "$HOME" --dotfiles alacritty
fi

# Installs or updates tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    (
        cd "$HOME/.tmux/plugins/tpm" || exit
        git pull
    )
fi
