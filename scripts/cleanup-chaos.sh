#!/bin/bash

NAMESPACE="sre-demo"

echo "Removing chaos workloads..."

kubectl delete pod cpu-stress -n "$NAMESPACE" --ignore-not-found
kubectl delete pod memory-stress -n "$NAMESPACE" --ignore-not-found

echo
echo "Chaos workloads removed."

kubectl get pods -n "$NAMESPACE"
