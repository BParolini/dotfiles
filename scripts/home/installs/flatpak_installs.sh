#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Flatpak, flathub and some packages

dnf install -y flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Media apps
flatpak install -y --or-update flathub com.spotify.Client
flatpak install -y --or-update flathub tech.feliciano.pocket-casts

# Communication apps
flatpak install -y --or-update flathub com.discordapp.Discord
flatpak install -y --or-update flathub com.slack.Slack
flatpak install -y --or-update flathub us.zoom.Zoom

# Util apps
flatpak install -y --or-update com.simplenote.Simplenote