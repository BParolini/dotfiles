#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs KDE plasma wayland

echo "Installing Plasma Wayland support"
dnf install -y \
    kwin-wayland \
    plasma-workspace-wayland \
    kwayland-integration \
    plasma-wayland-protocols \
    qt5-qtwayland \
    xorg-x11-server-Xwayland
