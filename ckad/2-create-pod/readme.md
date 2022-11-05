# Create a Pod

Create a pod named `pod1` and the container name should be `pod1-container`.

```
k run pod1 --image=httpd:2.4.41-alpine --restart=Never --dry-run=client -o yaml > 2-pod1.yaml
```

Create a script that returns the `pod1` status:

```
#!/bin/bash

kubectl get pod pod1 -o jsonpath='{.status.phase}{"\n"}'
```

