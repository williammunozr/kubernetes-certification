# Commands

- kubectl create secret docker-registry regcred \
  --docker.server=private-registry.io \
  --docker-username=registry-user \
  --docker-password=registry-password \
  --docker-email=registry-user@org.com
