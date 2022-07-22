#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Flatpak, flathub and some packages

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y --or-update com.getpostman.Postman
flatpak install -y --or-update io.github.shiftey.Desktop # GitHub Desktop
flatpak install -y --or-update com.github.artemanufrij.regextester
flatpak install -y --or-update io.dbeaver.DBeaverCommunity
flatpak install -y --or-update com.github.arshubham.gitignore
