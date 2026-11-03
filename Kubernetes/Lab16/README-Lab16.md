# Lab 16 – Kubernetes Resource Management and Update Strategy

## Objective
Configure Kubernetes Deployment resource requests, limits,
and RollingUpdate strategy.

## Deployment
- Name: ivolveapp
- Namespace: ivolve

## RollingUpdate Strategy
- Type: RollingUpdate
- maxSurge: 0
- maxUnavailable: 1

## Container Resource Configuration
Container: ivolve-app

### Requests
- CPU: 1
- Memory: 1Gi

### Limits
- CPU: 2
- Memory: 2Gi

## Verification
The configuration was applied to the existing Deployment
and verified using:

```bash
kubectl get deployment ivolveapp -n ivolve \
  -o jsonpath='{.spec.strategy}{"\n"}{.spec.template.spec.containers[?(@.name=="ivolve-app")].resources}{"\n"}'
