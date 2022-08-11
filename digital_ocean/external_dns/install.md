# Installing External DNS using Helm

## Add repo to Helm

```
helm repo add bitnami https://charts.bitnami.com/bitnami
```

## Update the repositories

```
helm repo update
```

## Install External DNS

```
helm install external-dns bitnami/external-dns -f externaldns-values.yaml
```

## Verify the External DNS

```
kubectl --namespace=default get pods -l "app.kubernetes.io/name=external-dns,app.kubernetes.io/instance=external-dns"
```

