#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Generates a new SSH key

if [ $# -eq 0 ] || [ -z "$1" ]
then
    echo "E-mail must be supplied"
fi

# ssh-keygen -t rsa -b 4096 -C "$1"
ssh-keygen -o -a 100 -t ed25519 -C "$1"
