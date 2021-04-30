#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs various npm packages globally

echo "Installing global NPM packages"
npm -g install npm \
               typescript \
               @angular/cli \
               @vue/cli \
               json-server \
               newman
