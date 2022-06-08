#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs various emulators

flatpak install -y --or-update org.ppsspp.PPSSPP net.rpcs3.RPCS3 io.mgba.mGBA org.citra_emu.citra com.github.AmatCoder.mednaffe

dnf install -y pcsxr pcsx2 dolphin-emu snes9x snes9x-gtk mupen64plus desmume
