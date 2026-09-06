#!/bin/bash
set -e

NAMESPACE="sre-demo"

echo "=== Chaos: Killing one NGINX pod ==="

POD=$(kubectl get pods -n "$NAMESPACE" \
  -l app=demo-nginx \
  -o jsonpath='{.items[0].metadata.name}')

if [ -z "$POD" ]; then
  echo "No NGINX pod found"
  exit 1
fi

echo "Deleting pod: $POD"
kubectl delete pod "$POD" -n "$NAMESPACE"

echo "Waiting for Kubernetes recovery..."
kubectl wait --for=condition=Ready pod \
  -l app=demo-nginx \
  -n "$NAMESPACE" \
  --timeout=120s

echo "=== Recovery complete ==="
kubectl get pods -n "$NAMESPACE" -l app=demo-nginx
