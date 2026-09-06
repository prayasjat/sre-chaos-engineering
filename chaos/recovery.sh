#!/bin/bash
set -e

NAMESPACE="sre-demo"

echo "=== CHAOS RECOVERY ==="

kubectl delete pod cpu-stress -n "$NAMESPACE" --ignore-not-found
kubectl delete pod memory-stress -n "$NAMESPACE" --ignore-not-found

echo
echo "Waiting for NGINX..."
kubectl wait --for=condition=Ready pod \
  -l app=demo-nginx \
  -n "$NAMESPACE" \
  --timeout=120s

echo
echo "=== Current status ==="
kubectl get pods -n "$NAMESPACE"
