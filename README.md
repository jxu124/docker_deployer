# docker_deployment
docker_deployment

```bash
docker buildx build \
--push \
--platform linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/amd64 \
--tag antonyxu/hello_world:latest ./hello_world
```

```
DOCKER_IMAGE=antonyxu/hello_world
DOCKER_PLATFORMS=linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64
VERSION=latest
SUBDIR=./hello_world
```