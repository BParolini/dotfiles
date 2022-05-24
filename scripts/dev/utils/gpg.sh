#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Generates a GPG2 key

if [ $# -eq 0 ]
then
    echo "No arguments supplied."
    echo "You must inform \"<user_email>\""
    exit 1
fi

gpg2 --full-generate-key

# gpg2 --list-secret-keys --keyid-format LONG "$1"
key=$(gpg2 --list-secret-keys --keyid-format LONG "$1" | grep sec | awk '{print $2}' | awk -F "/" '{print $2}')

# Exports the key which must be added to your source control manager (e.g. GitHub)
gpg2 --armor --export $key

# Prints the key which must be added to Git
echo $key
