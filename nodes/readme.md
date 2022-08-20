# Nodes

Kubernetes runs your workload by placing containers into Pods to run on Nodes. A node may be a virtual or physical machine, depending on the cluster. Each node is managed by the control plane and contains the services necessary to run Pods.

- The name of a Node object must be a valid DNS subdomain name.
- Two nodes cannot have the same name at the same time.
- Kubernetes also assumes that a resource with the same name is the same object.

## Node's Components

- Kubelet
- Container Runtime
- kube-proxy

## Manual Node Administration

- You can create and modify Node objects using `kubectl`.
- When you want to create Node objects manually, set the kubelet flag `--register-node=false`.
- Marking a node as unschedulable prevents the scheduler from placing new pods onto that Node but does not affect existing Pods on the Node.

To mark a Node unschedulable, run:

```
kubectl cordon <node-name>
```

## Node Status

- Addresses
- Conditions
- Capacity and Allocatable
- Info

## Resources

- https://kubernetes.io/docs/concepts/architecture/nodes/

