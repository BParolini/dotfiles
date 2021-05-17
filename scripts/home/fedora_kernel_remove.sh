#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes old kernel versions and updates grub.cfg

echo "dnf remove -y $(dnf repoquery --installonly --latest-limit=-2 -q)"
dnf remove -y $(dnf repoquery --installonly --latest-limit=-2 -q)

echo
echo "=============================="
echo

echo "grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg"
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
