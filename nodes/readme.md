# Nodes

Kubernetes runs your workload by placing containers into Pods to run on Nodes. A node may be a virtual or physical machine, depending on the cluster. Each node is managed by the control plane and contains the services necessary to run Pods.

- The name of a Node object must be a valid DNS subdomain name.
- Two nodes cannot have the same name at the same time.
- Kubernetes also assumes that a resource with the same name is the same object.

## Node's Components

- Kubelet
- Container Runtime
- kube-proxy


