#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes old kernel versions and updates grub.cfg

echo "dnf remove -y $(rpm -qa | grep ^kernel | grep -v headers | grep -v $(uname -r) | grep -v srpm-macros)"
dnf remove -y $(rpm -qa | grep ^kernel | grep -v headers | grep -v $(uname -r) | grep -v srpm-macros)

echo
echo "=============================="
echo

echo "grub2-mkconfig -o /boot/grub2/grub.cfg"
grub2-mkconfig -o /boot/grub2/grub.cfg
