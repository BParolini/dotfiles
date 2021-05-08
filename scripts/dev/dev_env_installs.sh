#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Git, NodeJS and all C/C++ development tools

echo "dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo"
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo

echo "dnf install -y dnf-plugins-core git-all kdiff3 nodejs"
dnf install -y dnf-plugins-core git-all kdiff3 nodejs gh

echo "dnf group install -y --with-optional c-development"
dnf group install -y --with-optional c-development

BASEDIR=$(dirname "$0")

source $BASEDIR/vim.sh
source $BASEDIR/cpp_libs.sh
source $BASEDIR/vscode.sh
source $BASEDIR/docker/docker.sh
source $BASEDIR/virtualization.sh
source $BASEDIR/python.sh
