#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs various spelling dictionaries

echo "dnf install -y hunspell \
                hunspell-pt hunspell-en hunspell-en-US hunspell-en-GB hunspell-it \
                aspell aspell-pt_BR aspell-en aspell-it \
                autocorr-pt autocorr-en autocorr-it"

dnf install -y hunspell \
                hunspell-pt hunspell-en hunspell-en-US hunspell-en-GB hunspell-it \
                aspell aspell-pt_BR aspell-en aspell-it \
                autocorr-pt autocorr-en autocorr-it
