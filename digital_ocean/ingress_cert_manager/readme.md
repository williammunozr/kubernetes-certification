# Securing the Ingress Using Cert-Manager

## Create namespace

```
kubectl create namespace cert-manager
```

## Install the repository

```
helm repo add jetstack https://charts.jetstack.io
```

## Update the repository

```
helm repo update
```

## Install Cert-Manager

```
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.2.0 --set installCRDs=true
```

## Create Let's Encrypt Issuer

```
kubectl delete mutatingwebhookconfiguration.admissionregistration.k8s.io cert-manager-webhook
kubectl delete validatingwebhookconfigurations.admissionregistration.k8s.io cert-manager-webhook
kubectl apply -f staging_issuer.yaml
```

## Add certificates to the Ingress

```
kubectl apply -f hello-kubernetes-ingress.yaml
```

## Resources

- https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-on-digitalocean-kubernetes-using-helm
