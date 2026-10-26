# Kubernetes Lab 12: MySQL StatefulSet

## Objective
Deploy MySQL using Kubernetes configuration and workload resources.

## Files
- `lab12.yaml`: Defines the Secret, ConfigMap, headless Service, and StatefulSet.
- `scripts/verify-mysql.sh`: Verifies resources, Pod readiness, Service endpoints, and recent logs.

## Deploy
From the repository root:

`KUBECONFIG="$HOME/.kube/kubeadm-config" kubectl apply -f Kubernetes/Lab12/lab12.yaml`

## Verify
`KUBECONFIG="$HOME/.kube/kubeadm-config" Kubernetes/Lab12/scripts/verify-mysql.sh`

## Key Concepts
- **Secret:** Supplies database passwords to the container.
- **ConfigMap:** Supplies non-sensitive configuration such as the database host and username.
- **Headless Service:** Provides stable DNS discovery for StatefulSet Pods.
- **StatefulSet:** Manages Pods with stable identities.
- **Resource requests and limits:** Define scheduling requirements and resource ceilings.
- **nodeSelector and tolerations:** Allow the workload to run on the designated worker.

## Important Notes
- The manifest uses `emptyDir`, so database files are ephemeral and can be lost when the Pod is recreated.
- Credentials are for lab use only. Do not put real passwords in Git.
- A Kubernetes Secret is not, by itself, a guarantee of encryption at rest.
