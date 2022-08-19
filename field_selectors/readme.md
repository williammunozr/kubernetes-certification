# Field Selectors

Field Selectors let you select Kubernetes resources based on the value of one or more resouce fields.

## Field Selector Queries

- `metadata.name=my-service`
- `metadata.namespace!=default`
- `status.phase=Pending`

### Select all pods for which the value of the status.phase field is Running

```
kubectl get pods --field-selector status.phase=Running
```

```
k get pods --all-namespaces --field-selector=metadata.namespace!=default
```

```
k get pods --all-namespaces --field-selector=metadata.name!=etcd-docker-desktop
```

```
k get events --field-selector=involvedObject.name=liveness-http
```

