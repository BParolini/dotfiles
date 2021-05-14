#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Steam

dnf install -y steam

# Add the following parameters to the custom command in games' property window
# QT_AUTO_SCREEN_SCALE_FACTOR=0 LD_PRELOAD=/usr/lib64/libfreetype.so.6 __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia %command%

# Torchlight 2 needs an extra env variable
# SDL_VIDEO_X11_VISUALID= QT_AUTO_SCREEN_SCALE_FACTOR=0 LD_PRELOAD=/usr/lib64/libfreetype.so.6 __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia %command%
