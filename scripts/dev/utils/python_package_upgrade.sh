#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Upgrade all Python's global packages

if [ $# -ne 1 ]
then
    echo "Python desired executable must be provided"
    exit 1
fi

"$1" -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 "$1" -m pip install -U
