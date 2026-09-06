#!/bin/bash
set -e

NAMESPACE="sre-demo"

echo "=== Chaos: Memory stress ==="

kubectl run memory-stress \
  -n "$NAMESPACE" \
  --image=polinux/stress \
  --restart=Never \
  -- stress --vm 1 --vm-bytes 300M --vm-hang 60

echo "Memory stress pod created."

kubectl get pod memory-stress -n "$NAMESPACE"

echo
echo "To stop chaos:"
echo "kubectl delete pod memory-stress -n $NAMESPACE"
