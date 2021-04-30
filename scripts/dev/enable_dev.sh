#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Stops and disables Docker, MariaDB, PostgreSQL and libvirtd services

systemctl enable docker
#systemctl enable mariadb
#systemctl enable postgresql
systemctl enable libvirtd

systemctl start docker
#systemctl start mariadb
#systemctl start postgresql
systemctl start libvirtd
