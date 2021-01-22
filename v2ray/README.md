# Docker - v2ray

- Ref. https://github.com/v2ray/v2ray-core
- Github https://github.com/antonyxu-git/docker_deployment/tree/main/v2ray
- Docker https://hub.docker.com/repository/docker/antonyxu/v2ray

## Useage

Put your configuration files (`config.json`) in a folder (such as `/etc/v2ray`).
In addition, you can get the sample configuration in the following ways:

```bash
mkdir -p $HOME/conf/v2ray
sudo docker run -it --rm antonyxu/v2ray cat /etc/v2ray/config.json > $HOME/conf/v2ray/config.json
```

Run

```bash
# run
sudo docker run -it --rm --network host -v $HOME/conf/v2ray:/config antonyxu/v2ray v2ray

# daemon
sudo docker run -itd --name v2ray --restart=always --network host -v $HOME/conf/v2ray:/config antonyxu/v2ray

# others
sudo docker start v2ray
sudo docker stop v2ray
sudo docker restart v2ray
```
