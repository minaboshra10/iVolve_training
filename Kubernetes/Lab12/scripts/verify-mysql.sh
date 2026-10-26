#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${1:-ivolve}"

echo "=== MySQL Resources ==="
kubectl get configmap/ivolve-cm secret/ivolve-secret \
  service/mysql statefulset/mysql pod/mysql-0 \
  -n "$NAMESPACE"

echo
echo "=== Wait for MySQL Pod ==="
kubectl wait --for=condition=Ready pod/mysql-0 \
  -n "$NAMESPACE" --timeout=120s

echo
echo "=== MySQL Service Endpoints ==="
kubectl get endpoints mysql -n "$NAMESPACE"

echo
echo "=== Recent MySQL Logs ==="
kubectl logs mysql-0 -n "$NAMESPACE" --tail=15

echo
echo "MySQL verification completed successfully."
