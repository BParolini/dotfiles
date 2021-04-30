#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Node.js version using nvm and basic npm global packages

if [ "$#" -ne  1 ]
then
    echo "Missing Node.js version"
    exit 1
fi

echo "Installing Node.js version $1"
nvm install "$1"

echo "Setting Node.js $1 as the default"
nvm use "$1"
nvm alias default "$1"

echo "Installing global npm packages"
npm -g install npm \
               @vue/cli \
               typescript \
               json-server \
               newman
