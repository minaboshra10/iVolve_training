# Lab 12: ConfigMap, Secret, StatefulSet and Headless Service

## Resources
- ConfigMap: `ivolve-cm`
- Secret: `ivolve-secret`
- Headless Service: `mysql`
- StatefulSet: `mysql`
- Pod: `mysql-0`

## Verification
```bash
kubectl get configmap,secret,service,statefulset,pods -n ivolve
kubectl logs mysql-0 -n ivolve
kubectl get endpoints mysql -n ivolve
```

## Notes
- Use demonstration passwords only; never commit real credentials.
- `emptyDir` storage is temporary and data may be lost when the pod is recreated.
- Kubernetes Secrets are not automatically encrypted simply because they are stored as Secret resources.
