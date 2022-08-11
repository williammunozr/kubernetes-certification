# Field Selectors

```
k get pods --all-namespaces --field-selector=metadata.namespace!=default
```

```
k get pods --all-namespaces --field-selector=metadata.name!=etcd-docker-desktop
```

```
k get events --field-selector=involvedObject.name=liveness-http
```

