# Kubernetes Lab 13: Persistent Storage Setup

## Objective
Configure persistent storage for application logging using a PersistentVolume (PV) and PersistentVolumeClaim (PVC).

## Configuration
- **PV Name:** `ivolvepv`
- **Capacity:** `1Gi`
- **Access Mode:** `ReadWriteMany`
- **Reclaim Policy:** `Retain`
- **Storage Type:** `hostPath`
- **Host Path:** `/mnt/app-logs`
- **Node Affinity:** `nti-virtual-machine`
- **PVC Name:** `ivolvepvc`
- **Namespace:** `ivolve`
- **StorageClass:** None

## Files
- `pv.yaml`: Defines the PersistentVolume.
- `pvc.yaml`: Defines the PersistentVolumeClaim.

## Verification
Commands used:

```bash
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl get pv
kubectl get pvc -n ivolve
```

**Result:** The PV and PVC were successfully created and reached the `Bound` state.

## Notes
The PV uses node-local `hostPath` storage. `ReadWriteMany` does not make this directory shared across multiple nodes. Node affinity keeps workloads using this volume aligned with the node that hosts the directory.

The directory permissions used for this lab are for learning purposes and should be restricted appropriately in production.
