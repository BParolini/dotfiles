#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs NVidia drivers

echo "dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda vdpauinfo libva-vdpau-driver libva-utils"
dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda vdpauinfo libva-vdpau-driver libva-utils
