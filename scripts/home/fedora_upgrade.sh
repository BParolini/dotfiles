#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Upgrades Fedora, removes unnecessary packages and update Snap and Flatpak packages

echo "dnf upgrade -y --refresh"
dnf upgrade -y --refresh

echo
echo "=============================="
echo

echo "dnf autoremove -y"
dnf autoremove -y
