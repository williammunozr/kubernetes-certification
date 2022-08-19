# Labels and Selectors

- Labels are key/value pairs that are attached to objects.
- Are intented to be used to specify identifying attributes of objects that are meaningful and relevant to users.
- Labels can be used to organized and to select subsets of objects.
- Can be attached to objects at creation time and subsequently added and modified at any time.
- Each object can have a set of key/value labels defined.
- Each key must be unique for a given object.

## Syntax and Character Set

- Valid label keys have two segments: an option prefix and name, separated by a slash (`/`).
- The name segment is required and must be 63 character or less.
- Beginning and ending with an alphanumeric character (`[a-z0-9A-Z`]) with dashes (`-`), underscores (`_`), dots (`.`), and alphanumerics between.
- The prefix is optional.
- If the prefix is specified, must be a DNS subdomain, no longer than 253 characters in total, followed by a slash (`/`).
- If the prefix is ommited, the label key is presumed to be private to the user.
- A valid value must be 63 characters or less (can be empty).

## List and Watch Filtering

### Using equality-based

```
kubectl get pods -l environment=production,tier=frontend
```

### Using set-based requirements

```
kubectl get pods -l 'environment in (production), tier in (frontend)'
```

### Set-based requirements with OR operator on values

```
kubectl get pods -l 'environment in (production, qa)'
```

### Restricting negative matching via exists operator

```
kubectl get pods -l 'environment,environment notin (frontend)'
```

## Resources that support set-based requirements

- Job
- Deployment
- ReplicaSet
- DaemonSet

```
selector:
    matchLabels:
        component: redis
    matchExpressions:
        - {key: tier, operator: In, values: [cache]}
        - {key: environment, operator: NotIn, values: [dev]}
```

## Resources

- https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
