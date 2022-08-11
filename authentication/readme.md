# Authentication

There are multiple ways in which we can authenticate with Kubernetes. Some of them are:

- Usernames & Passwords
- Client Certificates
- Bearer Tokens
- Others

## Categories of Users

Kubernetes clusters have two categories of users:

- Normal Users
- Services Accounts

It's important to understand that Kubernetes does not have objects which represent normal users accounts. Kubernetes doesn't manage the user accounts natively.

## Service Accounts

### Create a service account

```
kubectl create sa external

kubectl run external-pod --image=nginx --dry-run=client -o yaml > authentication/sa-pod.yaml
```

Open the file authentication/sa-pod.yaml and append before `containers`:

```
serviceAccountName: external
```

Validate if the pod has a service account attached to it in the spec section:

```
kubectl get pod external-pod | grep serviceAccount
```

Connect to the pod:

```
kubectl exec -it external-pod -- bash
root@external-pod:/# ls -l /run/secrets/kubernetes.io/serviceaccount/
total 0
lrwxrwxrwx 1 root root 13 Aug  6 01:43 ca.crt -> ..data/ca.crt
lrwxrwxrwx 1 root root 16 Aug  6 01:43 namespace -> ..data/namespace
lrwxrwxrwx 1 root root 12 Aug  6 01:43 token -> ..data/token
root@external-pod:/# cat /run/secrets/kubernetes.io/serviceaccount/token
```

To decode a token use:

- https://token.dev


## Resources

- https://kubernetes.io/docs/reference/access-authn-authz/authentication/
