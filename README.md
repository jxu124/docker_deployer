# docker_deployment
docker_deployment

[![FrpBuild Status][1]][2][![V2ray Status][3]][4]

[1]: https://github.com/antonyxu-git/docker_deployment/workflows/FrpBuild/badge.svg "Github Test"
[2]: https://github.com/antonyxu-git/docker_deployment/actions?query=workflow%3AFrpBuild "Action Page"
[3]: https://github.com/antonyxu-git/docker_deployment/workflows/V2rayBuild/badge.svg "Github Test"
[4]: https://github.com/antonyxu-git/docker_deployment/actions?query=workflow%3AV2rayBuild "Action Page"


## help
https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/
https://github.com/marketplace/actions/docker-buildx

## Docker - v2ray

- Ref. https://github.com/v2ray/v2ray-core
- Github https://github.com/antonyxu-git/docker_deployment/tree/main/v2ray
- Docker https://hub.docker.com/repository/docker/antonyxu/v2ray

## Docker - Frp

- Ref. https://github.com/fatedier/frp
- Github https://github.com/antonyxu-git/docker_deployment/tree/main/frp
- Docker https://hub.docker.com/repository/docker/antonyxu/frp

## acme.sh

docker run --rm  -it  \
  -v "$(pwd)/ssl":/acme.sh  \
  --net=host \
  neilpang/acme.sh  --issue -d www.xujie.plus.tk  --standalone

## httpd

docker run -it --rm --network=host \
    -v $HOME/conf/httpd:/conf \
    -v $HOME/webdav:/webdav \
    -v $HOME/openfiles:/openfiles \
    httpd:2.4-alpine sh /conf/configure.sh

docker run -itd --name=httpd --restart=always --network=host \
    -v $HOME/conf/httpd:/conf \
    -v $HOME/webdav:/webdav \
    -v $HOME/openfiles:/openfiles \
    httpd:2.4-alpine sh /conf/configure.sh
