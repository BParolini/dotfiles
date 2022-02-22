#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR=$(dirname "$0")

rm $HOME/.aws
ln -s $BASEDIR/.aws $HOME/.aws

rm $HOME/.profile
ln -s $BASEDIR/.profile $HOME/.profile

rm $HOME/.vimrc
ln -s $BASEDIR/.vimrc $HOME/.vimrc

rm $HOME/.zshrc
ln -s $BASEDIR/.zshrc $HOME/.zshrc

rm $HOME/.gradle/gradle.properties
ln -s $BASEDIR/gradle.properties $HOME/.gradle/gradle.properties

rm $HOME/.sdkman/etc/config
ln -s $BASEDIR/sdk.config $HOME/.sdkman/etc/config

rm $HOME/.config/Code/User/settings.json
ln -s $BASEDIR/vscode_settings.json $HOME/.config/Code/User/settings.json

rm /etc/fstab
ln -s $BASEDIR/fstab /etc/fstab
