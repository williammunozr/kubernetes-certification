# Owner and Dependents

In Kubernetes, some objects are owners of other objects. For example, a `ReplicaSet` is the owner of a set of `Pods`. These owned objects are **depedents** of their owner.

## owner references in object specifications

Dependent objects have a `metadata.ownerReferences` field that references their owner object. A valid owner reference consists of the object name and a UID within the same namespace as the dependent object. Kubernetes sets the value of this field automatically for objects that are dependents of other objects like ReplicaSets, DaemonSets, Deployments, Jobs and CronJobs, and ReplicationControllers.

Dependent objects also have an `ownerReferences.blockOwnerDeletion` field that takes a boolean value and controls whether specific dependents can block garbage collection from deleting their owner object.

## References

- https://kubernetes.io/docs/concepts/overview/working-with-objects/owners-dependents/

