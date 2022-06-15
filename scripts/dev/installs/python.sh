#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs multiple python versions

echo "Installing multiple Python versions and devel libs"
dnf install -y python3.6 python3.7 python3.8 python3.9 python3.10 python3.11 pipenv python3-Cython python3-extension-helpers python3-devel python3.11-devel

echo "Preparing pip"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.7 ./get-pip.py
python3.8 ./get-pip.py
python3.9 ./get-pip.py
python3.10 ./get-pip.py
python3.11 ./get-pip.py
rm -f ./get-pip.py

echo "Installing Cython"
python3.7 -m pip install --upgrade Cython
python3.8 -m pip install --upgrade Cython
python3.9 -m pip install --upgrade Cython
python3.10 -m pip install --upgrade Cython
python3.11 -m pip install --upgrade Cython

echo "Upgrading packages for all installed Python versions"
BASEDIR=$(dirname "$0")

source $BASEDIR/../utils/python_package_upgrade.sh python3.7
source $BASEDIR/../utils/python_package_upgrade.sh python3.8
source $BASEDIR/../utils/python_package_upgrade.sh python3.9
source $BASEDIR/../utils/python_package_upgrade.sh python3.10
source $BASEDIR/../utils/python_package_upgrade.sh python3.11
