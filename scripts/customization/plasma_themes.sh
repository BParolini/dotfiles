#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs KDE plasma themes

echo "dnf install -y plasma-breeze breeze-gtk breeze-icon-theme breeze-cursor-theme grub2-breeze-theme"
dnf install -y plasma-breeze breeze-gtk breeze-icon-theme breeze-cursor-theme grub2-breeze-theme

echo
echo "=============================="
echo

echo "dnf install -y adwaita-qt5 adwaita-gtk2-theme adwaita-icon-theme adwaita-cursor-theme"
dnf install -y adwaita-qt5 adwaita-gtk2-theme adwaita-icon-theme adwaita-cursor-theme

echo
echo "=============================="
echo

echo "dnf install -y plasma-oxygen qt5-style-oxygen oxygen-icon-theme oxygen-cursor-themes oxygen-fonts"
dnf install -y plasma-oxygen qt5-style-oxygen oxygen-icon-theme oxygen-cursor-themes oxygen-fonts

echo
echo "=============================="
echo

echo "dnf install -y qtcurve qtcurve-qt5 qtcurve-gtk2"
dnf install -y qtcurve qtcurve-qt5 qtcurve-gtk2
