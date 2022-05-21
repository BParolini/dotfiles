#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs LibreOffice

echo "Installing LibreOffice"
dnf install -y libreoffice libreoffice-filters \
               libreoffice-langpack-pt-BR libreoffice-pdfimport libreoffice-help-pt-BR
