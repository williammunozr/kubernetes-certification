# Ingress in Docker Desktop

## Ingress Install with Helm

```
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```

## Example

```
kubectl apply -f .
```

## Port forwarding

```
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
```

## Test

```
http://demo.localdev.me:8080/
```

