#!/bin/bash

set -e

NAMESPACE="sre-demo"

echo "======================================"
echo " SRE CHAOS LAB HEALTH CHECK"
echo "======================================"

echo
echo "=== Nodes ==="
kubectl get nodes

echo
echo "=== Pods ==="
kubectl get pods -n "$NAMESPACE"

echo
echo "=== Services ==="
kubectl get svc -n "$NAMESPACE"

echo
echo "=== Deployments ==="
kubectl get deployments -n "$NAMESPACE"

echo
echo "=== NGINX endpoints ==="
kubectl get endpoints demo-nginx -n "$NAMESPACE" || true

echo
echo "=== Health check complete ==="
