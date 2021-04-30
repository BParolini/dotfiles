#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs PostgreSQL and MariaDB

dnf install -y mariadb mariadb-server mariadb-server-utils \
    postgresql postgresql-server postgresql-contrib
