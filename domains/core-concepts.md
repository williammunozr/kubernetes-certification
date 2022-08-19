# Namespaces

## List all the Namespaces

```
kubectl get namespaces
kubectl get ns
```

## List all the pods in all namespaces

```
kubectl get pods --all-namespaces
```

## List all the pods in a particular namespace

```
kubectl get pods -n <namespace name>
```

## List all the services in a particular namespace

```
kubectl get svc -n <namespace name>
```

## List all the pods showing name and namespace with a json path expression

```
kubectl get pods -o=jsonpath="{.items[*]['metadata.name','metadata.namespace']}"
```

## Create an nginx pod in a default namespace and verify if the pod is running

```
kubectl run nginx --image=nginx --restart=Never

kuebctl get pods
```

## Create the same nginx pod with a yaml file

```
kubectl run nginx --image=nginx --restart=Never --dry-run=client -o yaml > nginx-pod.yaml


kubectl create -f nginx-pod.yaml
```

## Output the yaml file of the pod you just created

```
kubectl get pod nginx -o yaml
```

## Get the complete details of the pod you just created

```
kubectl describe pod nginx
```

## Delete the pod you just created

```
kubectl delete pod nginx 

kubectl delete -f nginx-pod.yaml
```

## Create the nginx pod with version 1.17.4 and expose it on port 80

```
kubectl run nginx --image=nginx:1.17.4 --restart=Never --port=80
```

## Change the image version to 1.15-alpine for the pod you just created and verify the image version

```
kubectl set image pod/nginx nginx=nginx:1.15-alpine

kubectl describe pod nginx

kubectl edit pod nginx

kubectl describe pod nginx
```

## Change the image version back to 1.17.1 for the pod you just updated and observe the change

```
kubectl set image pod/nginx nginx=nginx:1.17.1
kubectl describe pod nginx
kubectl get pod nginx -w
```

## Check the image version without the describe command

```
kubectl get pod nginx -o jsonpath='{.spec.containers[].image}{"\n"}'
```

## Create the nginx pod and execute the simple shell on the pod

```
kubectl run nginx --image=nginx --restart=Never

kubectl exec -it nginx -- /bin/sh
```

## Get the IP Address of the pod you just created

```
kubectl get pod nginx -o wide
```

## Create a busybox pod and run command ls while creating it and check the logs

```
kubectl run busybox --image=busybox --restart=Never -- ls

kubectl logs busybox -f
```

## Create a busybox pod with command sleep 3600

```
kubectl run busybox --image=busybox --restart=Never -- /bin/sh -c "sleep 3600"
```

## Check the connection of the nginx pod from the busybox pod

```
kubectl get pod nginx -o wide

kubectl exec -it busybox -- wget -o- <IP Address>
```

## Create a busybox pod and echo message "How are you" and delete manually

```
kubectl run busybox --image=nginx --restart=Never -it -- echo "How are you"

kubectl delete pod busybox --force
```

## Create a busybox pod and echo message "How are you" and delete it immediately

```
kubectl run busybox -it --rm --image=nginx --restart=Never -- echo "How are you"
```

## Create an nginx pod and list the pod with different levels of verbosity

```
kubectl run nginx --image=nginx --restart=Never --port=80

kubectl get pod nginx --v=7
kubectl get pod nginx --v=8
kubectl get pod nginx --v=9
```

## List the nginx pod with custom columns POD_NAME and POD_STATUS

```
kubectl get pod -o=custom-columns="POD_NAME:.metadata.name,POD_STATUS:.status.containerStatuses[].state"
```

## List all the pods sorted by name

```
kubectl get pods --sort-by=.metadata.name
```

## List all the pods sorted by created timestamp

```
kubectl get pods --sort-by=.metadata.creationTimestamp
```

