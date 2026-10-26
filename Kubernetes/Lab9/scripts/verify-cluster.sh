#!/usr/bin/env bash
set -euo pipefail

echo "=== Kubernetes Nodes ==="
kubectl get nodes -o wide

echo
echo "=== System Pods ==="
kubectl get pods -A

echo
echo "=== Flannel Pods ==="
kubectl get pods -n kube-flannel
