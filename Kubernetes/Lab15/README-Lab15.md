# Lab 15 – Application Deployment with Persistent Storage

## Objective
Deploy the iVolve application using Kubernetes Deployment,
Service, PersistentVolume, and PersistentVolumeClaim.

## Kubernetes Resources
- Deployment: ivolveapp
- Service: ivolvaappsvc (ClusterIP)
- PersistentVolume: ivolvepv
- PersistentVolumeClaim: ivolvepvc
- Replicas: 2

## Application Configuration
- Image: minaboshra/ivolveapp:lab8
- Container Port: 3000
- Service Port: 80
- Database: MySQL
- Database Name: ivolve

## Init Container
The mysql-init container:
- Waits for MySQL to become available.
- Creates the ivolve database.
- Grants database privileges to the application user.

## Environment Configuration
- ConfigMap: ivolve-cm
- Secret: ivolve-secret
- Sensitive credentials are not stored in this repository.

## Persistent Storage
The application uses the existing Lab13 PVC:
- PVC: ivolvepvc
- PV: ivolvepv
- Capacity: 1Gi
- Access Mode: ReadWriteMany
- Mount Path: /app/logs

## Scheduling
- Node Selector: project=ivolve
- Toleration: workload=ivolveApp:NoSchedule

## Apply
```bash
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
