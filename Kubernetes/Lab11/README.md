# Lab 11: Namespace and ResourceQuota

## Resources
- Namespace: `ivolve`
- ResourceQuota: `ivolve-quota`
- Maximum pods: 3

## Verification
```bash
kubectl get pods -n ivolve
kubectl describe resourcequota ivolve-quota -n ivolve
```

## Result
Three test pods were accepted; a fourth was rejected because it exceeded the quota.
