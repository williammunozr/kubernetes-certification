# Create Digital Ocean Cluster using CLI

## List the Kubernetes options

```
doctl kubernetes options versions
Slug            Kubernetes Version    Supported Features
1.23.9-do.0     1.23.9                cluster-autoscaler, docr-integration, ha-control-plane, token-authentication
1.22.12-do.0    1.22.12               cluster-autoscaler, docr-integration, ha-control-plane, token-authentication
1.21.14-do.1    1.21.14               cluster-autoscaler, docr-integration, ha-control-plane, token-authentication
```

## List compute size

```
doctl compute size list
```

## List the clusters

```
doctl kubernetes clusters list

ID                                      Name       Region    Version         Auto Upgrade    Status     Node Pools
27ae927d-ff11-47a8-9e7f-b6dd3c3c48da    ckadlab    nyc1      1.22.11-do.0    false           running    ckadlab-default-pool
```

## Create a Cluster

```
doctl kubernetes cluster create ckadlab --count 2 --size s-1vcpu-2gb --version 1.23.9-do.0 --region nyc1
```

## List Cluster's Nodes

```
kubectl get nodes

NAME                         STATUS   ROLES    AGE   VERSION
ckadlab-default-pool-cvzig   Ready    <none>   13m   v1.22.11
ckadlab-default-pool-cvziw   Ready    <none>   13m   v1.22.11
```

## Delete the Cluster

```
doctl kubernetes clusters delete ckadlab
```

