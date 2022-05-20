#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs RPMFusion repositories

echo "Installing RPMFusion repositories"
dnf install -y \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
