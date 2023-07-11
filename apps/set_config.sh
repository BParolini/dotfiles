#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$HOME/.profile"
ln -sf "$BASEDIR/profile" "$HOME/.profile"

rm -f "$HOME/.vimrc"
ln -sf "$BASEDIR/vimrc" "$HOME/.vimrc"

git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
rm -f "$HOME/.tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$BASEDIR/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

rm -f "$HOME/.zshrc"
ln -sf "$BASEDIR/zshrc" "$HOME/.zshrc"

rm -f "$XDG_CONFIG_HOME/i3/config"
mkdir -p "$XDG_CONFIG_HOME/i3"
ln -sf "$BASEDIR/i3.config" "$XDG_CONFIG_HOME/i3/config"

rm -f "$HOME/.gitconfig"
ln -sf "$BASEDIR/gitconfig" "$HOME/.gitconfig"

rm -f "$HOME/.gradle/gradle.properties"
ln -sf "$BASEDIR/gradle.properties" "$HOME/.gradle/gradle.properties"

rm -f "$HOME/.sdkman/etc/config"
ln -sf "$BASEDIR/sdk.config" "$HOME/.sdkman/etc/config"

rm -f "$HOME/.fleet/settings.json"
ln -sf "$BASEDIR/fleet_settings.json" "$HOME/.fleet/settings.json"

rm -f "$HOME/.config/Code/User/settings.json"
ln -sf "$BASEDIR/vscode_settings.json" "$HOME/.config/Code/User/settings.json"

sudo rm -f /etc/dnf/dnf.conf
sudo ln -sf "$BASEDIR/dnf.conf" /etc/dnf/dnf.conf
