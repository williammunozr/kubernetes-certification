# Security Context

- runAsUser: specifies the user of the running process in containers.
- runAsGroup: specifies the primary group for all processes within containers.
- fsGroup: applies the settings to volumes: Volumes which support ownership management are modified to be owned and writable by the GID specified in fsGroup.

## Deploy a Pod

```
kubectl apply -f pod-securitycontext.yaml
```

## Validate the processes ID in the pod

```
kubectl exec -it pod-context -- sh

/ $ ps
PID   USER     TIME  COMMAND
    1 1000      0:00 sleep 1h
    7 1000      0:00 sh
   13 1000      0:00 ps
```

## Deploy a pod with fsGroup

```
kubectl apply -f pod-securitycontext-fsgroup.yaml
```

## Validate the processes ID in the pod

```
kubectl exec -it security-context-fsgroup -- sh

/ $ ps
PID   USER     TIME  COMMAND
    1 1000      0:00 sleep 1h
    7 1000      0:00 sh
   13 1000      0:00 ps
```


