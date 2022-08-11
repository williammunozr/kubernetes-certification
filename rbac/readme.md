# Authorization

Authorization is the process of giving someone permission to perform some operation.

## Authorization Modules

Kubernetes provides multiple authorization modules like:

- AlwaysAllow
- AlwaysDeny
- Attribute-Based Access Control (ABAC)
- Role-Based Access Control (RBAC)
- Node
- WebHook

## Concepts

- A role containts rules that represent a set of permissions.
- A role binding grants permissions defined in a role to a user or set of users.

## Overview of ClusterRule

A Role can only be used to grant access to resources within a single namespace.

A ClusterRole can be used to grant the same permissions as a Role, but because they are cluster-scoped, they can also be used to grant access to:

- cluster-scoped resources (like nodes)
- namespaced resources (like pods) accross all namespaces

## References

- https://kubernetes.io/docs/reference/access-authn-authz/rbac/
