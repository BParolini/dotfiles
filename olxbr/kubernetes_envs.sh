#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Creates k8s alias for QA and prod contexts

export GH_TOKEN="***REMOVED***"

## K8s setup ##
alias k8s-qa='
kubectl config set-cluster https://api.k8s.qa.vivareal.io --server=https://api.k8s.qa.vivareal.io --insecure-skip-tls-verify &&
kubectl config set-credentials https://api.k8s.qa.vivareal.io --token="$GH_TOKEN" &&
kubectl config set-context https://api.k8s.qa.vivareal.io --cluster=https://api.k8s.qa.vivareal.io --user=https://api.k8s.qa.vivareal.io &&
kubectl config use-context https://api.k8s.qa.vivareal.io &&
kubectl cluster-info'

alias k8s-prod='
kubectl config set-cluster https://api.k8s.prod.vivareal.io --server=https://api.k8s.prod.vivareal.io --insecure-skip-tls-verify &&
kubectl config set-credentials https://api.k8s.prod.vivareal.io --token="$GH_TOKEN" &&
kubectl config set-context https://api.k8s.prod.vivareal.io --cluster=https://api.k8s.prod.vivareal.io --user=https://api.k8s.prod.vivareal.io &&
kubectl config use-context https://api.k8s.prod.vivareal.io &&
kubectl cluster-info'