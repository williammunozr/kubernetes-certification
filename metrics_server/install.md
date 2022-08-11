# Metrics Server

```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

## Error

```
E0802 11:32:17.637729       1 scraper.go:140] "Failed to scrape node" err="Get \"https://192.168.65.4:10250/metrics/resource\": x509: cannot validate certificate for 192.168.65.4 because it doesn't contain any IP SANs" node="docker-desktop"
```

## Solution (doesn't work)

```
https://github.com/kubernetes-sigs/metrics-server/issues/1025

kind: Deployment
spec:
    spec:
      containers:
      - args:
        - --kubelet-insecure-tls
```

Never use an insecure server.

```
k get deploy --all-namespaces
NAMESPACE              NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
ingress-nginx          ingress-nginx-controller    1/1     1            1           28d
kube-system            coredns                     2/2     2            2           104d
kube-system            metrics-server              0/1     1            0           8m40s
kubernetes-dashboard   dashboard-metrics-scraper   1/1     1            1           25d
kubernetes-dashboard   kubernetes-dashboard        1/1     1            1           25d
```

```
k edit deploy metrics-server -n kube-system
deployment.apps/metrics-server edited
```

Find the args entry and append at the end

```
spec:
    containers:
    - args:
        - --cert-dir=/tmp
        - --secure-port=4443
        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-use-node-status-port
        - --metric-resolution=15s
        - --kubelet-insecure-tls
 ```

```
k get APIService v1beta1.metrics.k8s.io
NAME                     SERVICE                      AVAILABLE                  AGE
v1beta1.metrics.k8s.io   kube-system/metrics-server   False (MissingEndpoints)   15m
```

# Solution 2

https://blog.adamgamboa.dev/how-to-enable-metric-server-in-docker-desktop/

```
k apply -f metric-server.yaml
```

```
kubectl get pods -n kube-system | grep metrics-server
```

```
k top nodes
NAME             CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
docker-desktop   234m         2%     2866Mi          36%
```

```
k top pods --all-namespaces
NAMESPACE              NAME                                        CPU(cores)   MEMORY(bytes)
ingress-nginx          ingress-nginx-controller-5756658855-7md6m   2m           168Mi
kube-system            coredns-78fcd69978-f87f9                    2m           17Mi
kube-system            coredns-78fcd69978-vp8nj                    3m           17Mi
kube-system            etcd-docker-desktop                         17m          87Mi
kube-system            kube-apiserver-docker-desktop               35m          340Mi
kube-system            kube-controller-manager-docker-desktop      16m          56Mi
kube-system            kube-proxy-z77p9                            1m           20Mi
kube-system            kube-scheduler-docker-desktop               3m           28Mi
kube-system            metrics-server-58b879586-wlwb9              4m           18Mi
kube-system            storage-provisioner                         2m           6Mi
kube-system            vpnkit-controller                           1m           10Mi
kubernetes-dashboard   dashboard-metrics-scraper-c45b7869d-cz2vb   1m           16Mi
kubernetes-dashboard   kubernetes-dashboard-764b4dd7-2hx99         1m           13Mi
```

