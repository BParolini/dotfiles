#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs all gstreamer and pulseaudio packages and some media players

dnf install -y $(dnf search gstreamer | grep ^gstreamer1*- | grep -v svt | grep -v devel | grep -v i686 | awk '{print $1}' | sort | uniq) \
                vlc vlc-core vlc-extras \
                clementine
