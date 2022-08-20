# Images

A container image represents binary data that encapsulates and application and all its software dependencies. Container images are executable software bundles that can run standalone and that make very well defined assumptions about their runtime environment.

You tupically create a container image of your application and push it to a registry before referring to it in a Pod.

## Notes

- You should avoid using the `:latest` tag when deploying containers in production at it is harder to track which version of the image is running and more difficult to rollback properly.
- To make sure the Pod always uses the same version of a container image, you can specify the image's digest; replace `<image-name>:<ta>` with `<image-name>@<digest>` for example, `image@sha256:777666555...>`.

## References

- https://kubernetes.io/docs/concepts/containers/images/
- [Create a Secret based on existing Docker credentials](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/#registry-secret-existing-credentials)
