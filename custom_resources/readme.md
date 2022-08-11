# Custom Resources

## Custom Resource Definition

Custom Resource Definition (CRDs) are extensions of Kubernetes API that stores collection of API objects of certain kind.

To create a CRD, we need to create a file that defines the object's kind.

Applying a CRD into the cluster makes the Kubernetes API Server to serve the specified custom resource.

## Custom Objects

After Custom Resource Definition object has been created, we can create custom objects.

## Create Custom Resource

```
kubectl apply -f custom_resources/crd.yaml
```

## Get Custom Resource

```
kubectl api-resources | grep crontab

crontabs                          ct           stable.godeveloper.net/v1              true         CronTab
```

## Start a proxy

```
kubectl proxy
Starting to serve on 127.0.0.1:8001
```

## Open in the browser

http://localhost:8001/apis/stable.godeveloper.net/v1

## Create an object

```
kubectl apply -f custom_resources/crd-object.yaml
crontab.stable.godeveloper.net/godeveloper-contab created
```

## List the object

```
kubectl get crontab
NAME                 AGE
godeveloper-contab   5s
```

# Kubernetes Controller

A controller tracks at least one Kubernetes resource type.

These objects have a spec field that represents the desired state.

