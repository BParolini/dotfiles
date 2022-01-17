#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs various emulators

snap install mgba citra-emu

flatpak install -y --or-update ppsspp RPCS3

dnf install -y pcsxr pcsx2 dolphin-emu snes9x snes9x-gtk mupen64plus desmume
