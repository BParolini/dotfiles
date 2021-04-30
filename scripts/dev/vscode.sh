#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs VS Code editor

echo "Importing VS Code Fedora repository"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo

echo "Updating repositories' cache and installing VS Code"
dnf check-update
dnf install -y code
