#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Sets xrandr to use primarily amdgpu card

xrandr --setprovideroffloadsink 1 0

# Add this script to .shrc:
# source "$HOME/brunoparolini@gmail.com/Config/home/scripts/radeon.sh"
# All GPU heavy apps must define DRI_PRIME=1 before starting
