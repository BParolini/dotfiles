#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$HOME/.profile"
ln -sf "$BASEDIR/profile" "$HOME/.profile"

. "$BASEDIR/xdg_defaults.sh"

rm -f "$XDG_CONFIG_HOME/alacritty/alacritty.yml"
mkdir -p "$XDG_CONFIG_HOME/alacritty"
ln -sf "$BASEDIR/alacritty.yml" "$XDG_CONFIG_HOME/alacritty/alacritty.yml"

rm -f "$HOME/.zshrc"
ln -sf "$BASEDIR/zshrc" "$HOME/.zshrc"

rm -f "$HOME/.vimrc"
rm -f "$HOME/.ideavimrc"
ln -sf "$BASEDIR/vimrc" "$HOME/.vimrc"
ln -sf "$BASEDIR/vimrc" "$HOME/.ideavimrc"

git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
rm -f "$HOME/.tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$BASEDIR/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

