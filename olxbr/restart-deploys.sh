#!/usr/bin/env bash
# Restart all deployments in a Kubernetes namespace and wait for all rollouts to finish successfully.

set -e

NAMESPACE=$1

if [ -z "${NAMESPACE}" ]; then
	echo "Usage: $0 NAMESPACE"
	exit 1
fi

DEPLOYMENTS=`kubectl -n $NAMESPACE get deployments | awk '{print $1}' | tail -n +2 | grep -v redis`

for d in $DEPLOYMENTS ; do
	kubectl -n $NAMESPACE rollout restart deployment $d
done

for d in $DEPLOYMENTS ; do
	kubectl -n $NAMESPACE rollout status deployment $d
done

