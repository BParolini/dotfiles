#!/usr/bin/env zsh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Runs GNU Stow

BASEDIR="$(dirname "$(realpath "$0")")"

packages=(
    "stow"
    "fonts"
    "zsh"
    "starship"
    "wezterm"
    "vim"
    "tmux"
    "gradle"
    "sdkman"
    "bat"
    "yazi"
)

# Run GNU stow in all repo packages
for p in "${packages[@]}"; do
    stow -d "$BASEDIR" -t "$HOME" --no-folding --dotfiles "$p"
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
        "wget"
        "gh"
    )
    for p in "${packages[@]}"; do
        stow -d "$BASEDIR" -t "$HOME" --no-folding --dotfiles "$p"
    done

    brew bundle install --file ~/Brewfile
else
    packages=(
        "alacritty"
        "ghostty"
        "git"
        "plasma"
        "rust"
        "steam"
        "ssh"
    )
    for p in "${packages[@]}"; do
        stow -d "$BASEDIR" -t "$HOME" --no-folding --dotfiles "$p"
    done

    packages_with_folding=(
        "retroarch"
    )
    for p in "${packages_with_folding[@]}"; do
        stow -d "$BASEDIR" -t "$HOME" --dotfiles "$p"
    done

    sudo_packages=(
        "ipv6"
        "iwlwifi"
        "network_manager"
        "pacman"
        "podman"
    )
    for p in "${sudo_packages[@]}"; do
        sudo stow -d "$BASEDIR" -t / --no-folding --dotfiles "$p"
    done
fi

# Installs ZSH external plugins
SYNTAX_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
if [ ! -d "$SYNTAX_DIR" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYNTAX_DIR"
else
    (
        cd "$SYNTAX_DIR" || exit
        echo "$SYNTAX_DIR"
        git pull
    )
fi

SUGGESTIONS="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if [ ! -d "$SUGGESTIONS" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$SUGGESTIONS"
else
    (
        cd "$SUGGESTIONS" || exit
        echo "$SUGGESTIONS"
        git pull
    )
fi

# Installs or updates tpm
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    (
        cd "$TPM_DIR" || exit
        echo "$TPM_DIR"
        git pull
    )
fi
