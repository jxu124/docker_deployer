# docker_deployment
docker_deployment

https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/
https://github.com/marketplace/actions/docker-buildx


```bash
docker buildx build \
--push \
--platform linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/amd64 \
--tag antonyxu/hello_world:latest ./hello_world
```

Build and push to DockerHub
Another example to build and push Docker image on DockerHub.

On push event, Docker image crazymax/diun:edge is built and pushed on DockerHub.
On pull_request event, Docker image crazymax/diun:edge is built.
On schedule event, Docker image crazymax/diun:nightly is built and pushed on DockerHub.
On push tags event, Docker image crazymax/diun:<version> and crazymax/diun:latest is built and pushed on DockerHub.

```
DOCKER_IMAGE=antonyxu/hello_world
DOCKER_PLATFORMS=linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64
VERSION=latest
SUBDIR=./hello_world
```