# Kubernetes Lab 11: Namespace and ResourceQuota

## Objective
Isolate application resources in a namespace and limit the number of Pods.

## Manifest
`manifests/namespace-quota.yaml` defines:
- Namespace: `ivolve`
- ResourceQuota: `ivolve-quota`
- Maximum number of Pods: `3`

## Apply
From the repository root:

`KUBECONFIG="$HOME/.kube/kubeadm-config" kubectl apply -f Kubernetes/Lab11/manifests/namespace-quota.yaml`

## Verify
`KUBECONFIG="$HOME/.kube/kubeadm-config" kubectl describe resourcequota ivolve-quota -n ivolve`

## Key Concepts
- **Namespace:** Provides logical isolation for Kubernetes resources.
- **ResourceQuota:** Limits aggregate resource consumption within a namespace.
- **Hard limit:** The maximum allowed value for a quota resource.
- **Used:** The current amount counted against the quota.

## Expected Result
The `ivolve` namespace has a ResourceQuota named `ivolve-quota` with a Pod limit of 3. Creating Pods beyond the quota is rejected.

## Safety Note
Apply the manifest to the existing namespace; do not delete the namespace to reset the lab, because that would delete its resources.
