#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Kate editor

echo "dnf install -y python3.6 python3.7 python3.8"
dnf install -y python3.6 python3.7 python3.8

echo "Preparing pip"
python3.6 get-pip.py
python3.7 get-pip.py
python3.8 get-pip.py
