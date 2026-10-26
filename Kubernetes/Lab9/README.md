# Lab 9: Kubernetes Cluster Setup

## Objective
Set up a two-node Kubernetes cluster using kubeadm.

## Environment
- Control Plane: nti-virtual-machine (192.168.91.134)
- Worker: k8s-worker (192.168.91.138)
- Kubernetes: v1.35.9
- Runtime: containerd
- CNI: Flannel
- Pod CIDR: 10.244.0.0/16

## Verification
```bash
kubectl get nodes -o wide
kubectl get pods -A
```
