# Lab 9: Kubernetes Cluster Setup

## Objective
Set up and verify a two-node Kubernetes cluster using kubeadm.

## Environment
- OS: Ubuntu 22.04.5 LTS
- Kubernetes: v1.35.9
- Container runtime: containerd
- CNI: Flannel
- Pod CIDR: 10.244.0.0/16

| Node | IP | Role |
|---|---|---|
| nti-virtual-machine | 192.168.91.134 | Control Plane |
| k8s-worker | 192.168.91.138 | Worker |

## Files
- `config/cluster.env.example`: Example cluster inventory.
- `scripts/verify-cluster.sh`: Checks node status, system pods, and Flannel pods.

## Run Verification
From the Lab9 directory:
`KUBECONFIG="$HOME/.kube/kubeadm-config" ./scripts/verify-cluster.sh`

## Expected Result
Both nodes are Ready, Kubernetes system pods are running, and Flannel is running on both nodes.

## Notes
This lab verifies the existing cluster; the inventory file does not create one. Never commit certificates, private keys, or admin kubeconfig files.
