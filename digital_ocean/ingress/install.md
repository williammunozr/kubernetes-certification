# Installing Ingress

## Add the repository to Helm

```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
```

## Update Helm

```
helm repo update
```

## Install Nginx Ingress

```
helm install nginx-ingress ingress-nginx/ingress-nginx --set controller.publishService.enabled=true
```

## Watch the load balancer become available

```
kubectl --namespace default get services -o wide -w nginx-ingress-ingress-nginx-controller
```

## References

- https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-on-digitalocean-kubernetes-using-helm

