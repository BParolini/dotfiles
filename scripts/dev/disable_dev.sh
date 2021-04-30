#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Stops and disables Docker, MariaDB, PostgreSQL and libvirtd services

systemctl stop docker
systemctl stop libvirtd

systemctl disable docker
systemctl disable libvirtd
