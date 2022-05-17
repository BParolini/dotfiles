#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs ZSH

if [ "$#" -ne  1 ]
then
    echo "Missing username"
    exit 1
fi

dnf install -y zsh

usermod --shell /usr/bin/zsh root
usermod --shell /usr/bin/zsh "$1"
