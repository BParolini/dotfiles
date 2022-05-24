#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Upgrades Fedora version

if [ $# -ne 1 ]
then
    echo "New Fedora version must be supplied"
    exit 1
fi

dnf install -y python3-dnf-plugin-system-upgrade

dnf upgrade --refresh

dnf system-upgrade download --releasever="$1"

dnf system-upgrade reboot
