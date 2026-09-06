#!/bin/bash
set -e

NAMESPACE="sre-demo"

echo "=== Chaos: CPU stress ==="

kubectl run cpu-stress \
  -n "$NAMESPACE" \
  --image=busybox \
  --restart=Never \
  -- /bin/sh -c 'while true; do :; done'

echo "CPU stress pod created."

kubectl get pod cpu-stress -n "$NAMESPACE"

echo
echo "To stop chaos:"
echo "kubectl delete pod cpu-stress -n $NAMESPACE"
