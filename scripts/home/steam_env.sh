#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Prepares Steam environment

# Create a symbolic link to this file in $HOME/.config/plasma-workspace/env
# ln -s $HOME/.dotfiles/scripts/home/steam_env.sh $HOME/.config/plasma-workspace/env

export QT_AUTO_SCREEN_SCALE_FACTOR=0

STEAM_APP_PATH=$(which steam)
alias steam="env QT_AUTO_SCREEN_SCALE_FACTOR=0 LD_PRELOAD=/usr/lib64/libfreetype.so.6 __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia $STEAM_APP_PATH"
