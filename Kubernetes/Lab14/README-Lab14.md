# Lab 14 – MySQL StatefulSet with Persistent Storage

## Objective
Deploy MySQL using Kubernetes StatefulSet and persistent storage.

## Kubernetes Resources
- PersistentVolume: ivolvedb-pv
- PersistentVolumeClaim: mysql-data-ivolvedb-0
- StatefulSet: ivolvedb
- Headless Service: ivolvedbsvc

## Storage Configuration
- Capacity: 2Gi
- Access Mode: ReadWriteOnce
- Storage Class: mysql-local
- Reclaim Policy: Retain
- Storage Path: /mnt/mysql-data
- Storage Node: k8s-worker

## Database Configuration
- MySQL Image: mysql:8.4
- Database: appdb
- Credentials are provided through Kubernetes ConfigMap and Secret.

## Scheduling
- Node Selector: project=ivolve
- Toleration: workload=ivolveApp:NoSchedule

## Verification
- MySQL Pod reached Running state.
- PersistentVolumeClaim was successfully bound.
- MySQL database initialization was verified.
- Database list was checked using MySQL CLI.
- StatefulSet DNS resolution was tested successfully.

## Apply
```bash
kubectl apply -f lab14-mysql-pv.yaml
kubectl apply -f lab14-mysql.yaml
