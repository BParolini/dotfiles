#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Kate editor

echo "dnf install -y python3.6 python3.7 python3.8 python3.9 python3.10 pipenv python3-Cython python3-extension-helpers"
dnf install -y python3.6 python3.7 python3.8 python3.9 python3.10 pipenv python3-Cython python3-extension-helpers

echo "Preparing pip"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.6 ./get-pip.py
python3.7 ./get-pip.py
python3.8 ./get-pip.py
python3.9 ./get-pip.py
python3.10 ./get-pip.py
