#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs all pipewire and gstreamer packages and some media players

dnf install -y $(dnf search pipewire | grep ^pipewire | grep -v devel | grep -v doc | grep -v jack | awk '{print $1}' | uniq | sort) \
               $(dnf search gstreamer | grep ^gstreamer1*- | grep -v svt | grep -v devel | grep -v i686 | awk '{print $1}' | sort | uniq) \
               vlc vlc-core vlc-extras \
               clementine
