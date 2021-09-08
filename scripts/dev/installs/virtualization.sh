#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Virtualization group of applications and enables and starts libvirtd

echo "dnf group install -y --with-optional virtualization"
dnf group install -y --with-optional virtualization

echo "Enabling and starting libvirtd"
systemctl enable libvirtd
systemctl start libvirtd

echo "Verifying if kvm is running"
lsmod | grep kvm
