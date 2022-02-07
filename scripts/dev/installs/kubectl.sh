#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs kubectl

echo "Importing Kubernetes Fedora repository"
echo -e "[kubernetes]\nname=Kubernetes\nbaseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg" > /etc/yum.repos.d/kubernetes.repo

echo "Updating repositories' cache and installing kubectl"
dnf install -y kubectl
