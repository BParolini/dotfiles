#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs NodeJS versions as modules

echo "Installing default nodejs"
dnf install -yb nodejs

echo
echo "=============================="
echo

echo "Installing extra nodejs modules"
dnf module install nodejs:10 nodejs:12
