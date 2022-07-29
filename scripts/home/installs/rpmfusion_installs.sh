#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs RPMFusion repositories

BASEDIR=$(dirname "$0")

. "$BASEDIR/rpmfusion.sh"
. "$BASEDIR/media.sh"
. "$BASEDIR/nvidia.sh"
. "$BASEDIR/vulkan.sh"
. "$BASEDIR/plasma_wayland.sh"
