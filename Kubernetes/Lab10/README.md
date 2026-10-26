# Kubernetes Lab 10: Node Labels and Taints

## Objective
Configure a Kubernetes worker node using labels and taints to control workload scheduling.

## Configuration
- Node: `k8s-worker`
- Label: `project=ivolve`
- Taint: `workload=ivolveApp:NoSchedule`

## Script
`scripts/configure-worker.sh` applies the label and taint.

## Run
From the repository root:

`KUBECONFIG="$HOME/.kube/kubeadm-config" Kubernetes/Lab10/scripts/configure-worker.sh`

## Key Concepts
- **Label:** Identifies nodes for selection using `nodeSelector` or node affinity.
- **Taint:** Repels Pods that do not have a matching toleration.
- **Toleration:** Allows a Pod to run on a tainted node but does not guarantee scheduling.
- **NoSchedule:** Prevents new Pods without a matching toleration from being scheduled.

## Result
The worker remains Ready, labeled `project=ivolve`, and tainted with `workload=ivolveApp:NoSchedule`.
