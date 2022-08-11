# Config Maps

## Create a Config Map

```
kubectl create configmap dev-config --from-literal=app.mem=2048m
```

## Create a Config Map from file

```
kubectl create configmap dev-properties --from-file=dev.properties
```

