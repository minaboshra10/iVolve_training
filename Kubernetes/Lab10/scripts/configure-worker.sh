#!/usr/bin/env bash
set -euo pipefail

NODE="${1:-k8s-worker}"

echo "Applying label..."
kubectl label node "$NODE" project=ivolve --overwrite

echo "Applying taint..."
kubectl taint node "$NODE" workload=ivolveApp:NoSchedule --overwrite

echo
echo "=== Node Labels ==="
kubectl get node "$NODE" --show-labels

echo
echo "=== Node Taints ==="
kubectl describe node "$NODE" | grep "^Taints:"
