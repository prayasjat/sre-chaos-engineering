#!/bin/bash

set -e

echo "=== Deploying SRE Chaos Lab ==="

kubectl apply -f kubernetes/exported/namespace.yaml
kubectl apply -f kubernetes/exported/demo-nginx-deployment.yaml
kubectl apply -f kubernetes/exported/demo-nginx-service.yaml

echo
echo "=== Deployment complete ==="

kubectl get pods -n sre-demo
kubectl get svc -n sre-demo
