#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Vulkan

dnf install -y mesa-vulkan-drivers \
               vulkan-loader \
               vulkan-tools \
               vulkan-validation-layers \
               libvkd3d \
               mangohud \
               vkmark
