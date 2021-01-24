# docker_deployment
docker_deployment

[![Frp Test][1]][2][![V2ray Test][3]][4]

[1]: https://github.com/antonyxu-git/rss_magnet/workflows/FrpDockerBuildx/badge.svg "Frp Test Pass"
[2]: https://github.com/antonyxu-git/rss_magnet/actions "Frp Test Failed"
[3]: https://github.com/antonyxu-git/rss_magnet/workflows/V2rayDockerBuildx/badge.svg "V2ray Test Pass"
[4]: https://github.com/antonyxu-git/rss_magnet/actions "V2ray Test Failed"


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
