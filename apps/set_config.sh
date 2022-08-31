#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR=$(dirname "$0")

ln -sf $BASEDIR/.profile $HOME/.profile

ln -sf $BASEDIR/.vimrc $HOME/.vimrc

ln -sf $BASEDIR/.zshrc $HOME/.zshrc

ln -sf $BASEDIR/gradle.properties $HOME/.gradle/gradle.properties

ln -sf $BASEDIR/sdk.config $HOME/.sdkman/etc/config

ln -sf $BASEDIR/fleet_settings.json $HOME/.fleet/settings.json

ln -sf $BASEDIR/vscode_settings.json $HOME/.config/Code/User/settings.json

ln -sf $BASEDIR/dnf.conf /etc/dnf/dnf.conf
