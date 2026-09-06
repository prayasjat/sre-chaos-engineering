#!/bin/bash
set -e

NAMESPACE="sre-demo"

echo "=== Chaos: Network delay ==="

POD=$(kubectl get pods -n "$NAMESPACE" \
  -l app=demo-nginx \
  -o jsonpath='{.items[0].metadata.name}')

echo "Target pod: $POD"

kubectl exec -n "$NAMESPACE" "$POD" -- \
  sh -c 'echo "Network-delay simulation target: $HOSTNAME"'

echo
echo "Network chaos placeholder created."
echo "Advanced network impairment will be introduced later using a dedicated chaos tool."
