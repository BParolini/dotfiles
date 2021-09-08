#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs HP Printer drivers

echo "dnf install -y hplip hplip-libs hplip-gui hplip-common"
dnf install -y hplip hplip-libs hplip-gui hplip-common
