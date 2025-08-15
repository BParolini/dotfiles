#!/usr/bin/env zsh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Runs GNU Stow

BASEDIR="$(dirname "$(realpath "$0")")"

packages=(
    "fonts"
    "zsh"
    "starship"
    "wezterm"
    "vim"
    "helix"
    "tmux"
    "gradle"
    "sdkman"
    "bat"
    "ssh"
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

    packages=(
        "brew"
        "alacritty-mac"
        "ghostty-mac"
        "fleet-mac"
        "wget"
        )
    for p in "${packages[@]}"; do
        stow -d "$BASEDIR" -t "$HOME" --dotfiles "$p"
    done

    brew bundle install --file ~/Brewfile
else
    packages=(
        "alacritty"
        "ghostty"
        "fleet"
        "git"
        "i3"
        "plasma"
    )
    for p in "${packages[@]}"; do
        stow -d "$BASEDIR" -t "$HOME" --dotfiles "$p"
    done
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
