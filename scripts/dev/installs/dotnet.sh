#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Adds Dotnet repository and installs Dotnet

echo "Enabling .NET Core Fedora repository"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
wget -q -O /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/fedora/32/prod.repo

echo "dnf install dotnet-sdk-2.2 dotnet-sdk-3.0 powershell"
dnf install dotnet-sdk-2.2 dotnet-sdk-3.0 powershell
