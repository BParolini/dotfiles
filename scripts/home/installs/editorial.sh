#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs various editorial applications

dnf install -by --skip-broken \
                krita krita-libs \
                inkscape inkscape-psd inkscape-table inkscape-view \
                scribus \
                audacity-freeworld \
                openssl-devel openssl-static
