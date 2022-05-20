#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Git, NodeJS and all C/C++ development tools

echo "dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo"
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo

echo
echo "=============================="
echo

echo "dnf install -y dnf-plugins-core git-all kdiff3 gh direnv jq jql"
dnf install -y dnf-plugins-core git-all kdiff3 gh direnv jq jql

echo
echo "=============================="
echo

echo "dnf group install -y --with-optional c-development"
dnf group install -y --with-optional c-development

echo
echo "=============================="
echo

BASEDIR=$(dirname "$0")

. "$BASEDIR/vim.sh"
. "$BASEDIR/cpp_libs_and_tools.sh"
. "$BASEDIR/nodejs.sh"
. "$BASEDIR/vscode.sh"
. "$BASEDIR/podman.sh"
. "$BASEDIR/docker/docker.sh"
. "$BASEDIR/kubectl.sh"
. "$BASEDIR/virtualization.sh"
. "$BASEDIR/python.sh"
