# List of commands

## Imperative Commands

### Create Objects
- kubectl run --image=nginx nginx
- kubectl create deployment --image=nginx nginx
- kubectl create deployment webapp --image=kodekloud/webapp-color
- kubectl expose deployment nginx --port 80

### Create a service
- kubectl expose pod redis --port=6379 --name redis-service 

### Create a pod and service with some specific name
- kubectl run httpd --image=httpd:alpine --port=80 --expose -o yaml --dry-run=client > service.yaml

### Update Objects

- kubectl edit deployment nginx
- kubectl scale deployment nginx --replicas=5
- kubectl set image deployment nginx nginx=nginx:1.18

- kubectl create -f nginx.yaml
- kubectl replace -f nginx.yaml
- kubectl delete -f nginx.yaml

### Declarative Commands
- kubectl apply -f service.yaml

### Create a YAML definition file from a command
- kubectl run redis --image=redis --dry-run=client -o yaml > pod.yml

### Update a number of replicas in a replica set
`Update the definition file` and run the following command:

- kubectl replace -f replica_set/rs-definition.yml

`Or`
- kubectl scale --replicas=6 -f replica_set/rs-definition.yml

`Or`

- kubectl scale --replicas=6 replicaset myapp-replicaset

### Set dev namespace as default
- kubectl config set-context $(kubectl config current-context) --namespace=dev

### Taints & Tolerations

- Taints are place on the nodes
- Tolerations are place on the pods

Commands:

- kubectl taint nodes node-name key=value:taint-effect

Taint-Effects

- NoSchedule
- PreferNoSchedule
- NoExecute

Example:

- Kubectl taint nodes node1 app=blue:NoSchedule
