# Rolling back deployments

## History of the deployment

```
kubectl rollout history deployment kplabs-deployment

REVISION  CHANGE-CAUSE
2         kubectl1.23.4 edit deployment kplabs-deployment --record=true
4         kubectl1.23.4 edit deployment kplabs-deployment --record=true
5         kubectl1.23.4 edit deployment kplabs-deployment --record=true
```

## Information of one revision

```
kubectl rollout history deployment kplabs-deployment --revision 4

deployment.apps/kplabs-deployment with revision #4
Pod Template:
  Labels:       app=kplabs-deployment
        pod-template-hash=5f67dd4b6
  Annotations:  kubernetes.io/change-cause: kubectl1.23.4 edit deployment kplabs-deployment --record=true
  Containers:
   nginx:
    Image:      nginx:1.23.0
    Port:       80/TCP
    Host Port:  0/TCP
    Environment:        <none>
    Mounts:     <none>
  Volumes:      <none>
```

## List of replicasets

```
kubectl get rs

NAME                           DESIRED   CURRENT   READY   AGE
kplabs-deployment-5894f5c54d   0         0         0       37m
kplabs-deployment-5f67dd4b6    0         0         0       32m
kplabs-deployment-6f445b8c78   3         3         3       40m
```

## Going back to a revision

```
kubectl rollout undo deploy kplabs-deployment --to-revision=2

deployment.apps/kplabs-deployment rolled back
```

This deployment has errors, because the image doesn't exists.

```
kubectl describe deployment kplabs-deployment | grep Image
    Image:        apache
```

Return to a working revision:

List of revisions

```
kubectl rollout history deployment kplabs-deployment

deployment.apps/kplabs-deployment
REVISION  CHANGE-CAUSE
4         kubectl1.23.4 edit deployment kplabs-deployment --record=true
5         kubectl1.23.4 edit deployment kplabs-deployment --record=true
6         kubectl1.23.4 edit deployment kplabs-deployment --record=true
```

Return to a working revision

```
kubectl rollout undo deploy kplabs-deployment --to-revision=5

deployment.apps/kplabs-deployment rolled back
```

Validate the image version

```
kubectl describe deployment kplabs-deployment | grep Image
    Image:        nginx
```

