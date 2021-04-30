#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs various editorial applications

dnf install -by --skip-broken \
                libreoffice libreoffice-filters \
                libreoffice-langpack-pt-BR libreoffice-pdfimport libreoffice-help-pt-BR \
                gimp gimp-libs gimp-data-extras gimp-help-pt_BR gimp-help \
                pdf-stapler pdfshuffler pdf-tools pdfmod \
                pandoc pandoc-common pandoc-pdf \
                krita krita-libs \
                inkscape inkscape-psd inkscape-table inkscape-view \
                scribus \
                audacity-freeworld \
                openssl-devel openssl-static
