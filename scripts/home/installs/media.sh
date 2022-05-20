#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Updates and installs multimedia apps and installs some players

echo "Updating multimedia apps and installing some players"
dnf groupupdate -y --with-optional Multimedia
dnf groupupdate -y sound-and-video

dnf install -y vlc vlc-core vlc-extras \
               clementine \
               kodi kodi-firewalld
