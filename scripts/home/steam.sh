#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Steam

dnf install -y steam

# STEAM_APP_PATH=$(which steam)
# alias steam="env QT_AUTO_SCREEN_SCALE_FACTOR=0 LD_PRELOAD=/usr/lib64/libfreetype.so.6 __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia $STEAM_APP_PATH"
