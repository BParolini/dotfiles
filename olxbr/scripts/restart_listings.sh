#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Restarts all listings applications

deployments=(
    "listings-api"
    "listings-api-cleaner-worker"
    "listings-api-converter-worker"
    "listings-api-crude-worker"
    "listings-api-limit-advertiser-worker"
    "listings-api-notifier-worker"
    "listings-api-renotifier-worker"
    "listings-api-unit-worker"
)

for deployment in "${deployments[@]}"
do
    kubectl rollout restart deployment "$deployment"
    # kubectl scale --replicas=1 deployment "$deployment"
done
