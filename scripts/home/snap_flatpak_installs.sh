#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Snap, Flatpak, flathub and some Snap and Flatpak packages

dnf install -y snapd flatpak
ln -s /var/lib/snapd/snap /snap

sleep 30

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Media apps
snap install spotify
snap install pocket-casts
snap install audible-for-linux

# Communication apps
snap install discord
snap install telegram-desktop
snap install slack --classic
# snap install --classic skype

# Dev Apps
snap install insomnia
snap install --classic heroku
flatpak install -y --or-update flathub io.dbeaver.DBeaverCommunity
