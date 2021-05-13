#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Steam

dnf install -y steam

# Add to .shrc
# alias steam='env LD_PRELOAD=/usr/lib64/libfreetype.so.6 QT_AUTO_SCREEN_SCALE_FACTOR=0 steam'
