# Container Lifecycle Hooks

kubelet managed Containers can use the Container lifecycle hook framework to run code triggered by events during their management lifecycle.

The hooks enable Containers to be aware of events in their management lifecycle and run code implemented in a handler when the corresponding lifecycle hook is executed.

## Container Hooks

There are two hooks that are exposed to Containers:

`PostStart`

This hook is executed immediately after a container is created. However, there is no guarantee that the hook will execute before the container ENTRYPOINT. No parameters are passed to the handler.

`PreStop`

This hook is called immediately before a container is terminated due to an API request or management event such as liveness/startup probe failure, preemption, resource contention and others. A call to the `PreStop` hook fails if the container is already in a terminated or completed state and the hook must complete before the TERM signal to stop the container can be sent.

## Hook handler implementations

There are two types of hook handlers that can be implemented for Containers:

- Exec - Executes a specific command, such as `pre-stop.sh`, inside the the cgroups and namespaces of the Container.
- HTTP - Executes and HTTP request against a specific endpoint on the Container.

## References

- https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/
