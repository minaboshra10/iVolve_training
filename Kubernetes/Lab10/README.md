# Lab 10: Node Taints and Labels

## Commands
```bash
kubectl taint nodes k8s-worker workload=ivolveApp:NoSchedule
kubectl label nodes k8s-worker project=ivolve
kubectl get nodes --show-labels
```

## Result
The worker has taint `workload=ivolveApp:NoSchedule` and label `project=ivolve`.
