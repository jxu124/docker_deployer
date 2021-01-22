# docker_deployment
docker_deployment

```bash
docker buildx build \
--push \
--platform linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/amd64 \
--tag antonyxu/hello_world:latest ./hello_world
```