#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Stops and disables Docker, MariaDB, PostgreSQL and libvirtd services

systemctl enable docker
systemctl enable libvirtd

systemctl start docker
systemctl start libvirtd
