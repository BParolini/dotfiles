#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs NVidia drivers

echo "Installing NVidia drivers"
dnf install -y \
    akmod-nvidia \
    xorg-x11-drv-nvidia-cuda \
    xorg-x11-drv-nvidia-cuda-libs \
    nvidia-modprobe \
    vdpauinfo \
    libva-vdpau-driver \
    libva-utils \
    libvdpau-va-gl \
    mesa-vdpau-drivers
