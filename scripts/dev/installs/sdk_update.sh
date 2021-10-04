#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Updates SDKMan's installed packages

echo "sdk flush"
sdk flush
sdk flush broadcast
sdk flush version

echo
echo "=============================="
echo

echo "sdk update"
sdk update

echo
echo "=============================="
echo

echo "sdk upgrade"
sdk upgrade
