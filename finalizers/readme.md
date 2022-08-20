# Finalizers

Finalizers are namespaced keys that tell Kubernetes to wait until specific conditions are met before it fully deletes resources marked for deletion.

When you tell Kubernetes to delete an object that has finalizers specified for it, the Kubernetes API marks the object for deletion by populating `.metadata.deletionTimestamp`, and returns a `202` status code (HTTP "Accepted").

## How finalizers work

Using a manifest file, you can specify finalizers in the `.metadata.finalizers` field. When you attempt to delete the resource, the API server handling the delete request notices the values in the `finalizers` field and does the following:

- Modifies the object to add a `metadata.deletionTimestamp` field with the time you started the deletion.
- Prevents the object from being removed until its `metadata.finalizers` field is empty.
- Returns a `202` status code (HTTP "Accepted"). 

## Resources

- https://kubernetes.io/docs/concepts/overview/working-with-objects/finalizers/

