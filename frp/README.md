# Docker - Frp

- Ref. https://github.com/fatedier/frp
- Github https://github.com/antonyxu-git/docker_deployment/tree/main/frp
- Docker https://hub.docker.com/repository/docker/antonyxu/frp

## Useage

Put your configuration files (`frps.ini` or `frpc.ini`) in a folder (such as `/etc/frp`).
In addition, you can get the sample configuration in the following ways:

```bash
CONF_FLODER=/etc/frp

sudo docker run -it --rm antonyxu/frp cat /etc/frp/frps.ini > ${CONF_FLODER}/frps.ini
sudo docker run -it --rm antonyxu/frp cat /etc/frp/frpc.ini > ${CONF_FLODER}/frpc.ini
```

Run
```bash
CONF_FLODER=/etc/frp
CONF_FLODER=$HOME/conf/frp

# run
sudo docker run -it --rm --network host -v ${CONF_FLODER}:/config antonyxu/frp frps
sudo docker run -it --rm --network host -v ${CONF_FLODER}:/config antonyxu/frp frpc

# daemon
sudo docker run -itd --name frps --restart=always --network host -v ${CONF_FLODER}:/config antonyxu/frp frps
sudo docker run -itd --name frpc --restart=always --network host -v ${CONF_FLODER}:/config antonyxu/frp frpc

# others
sudo docker start frpc
sudo docker stop frpc
sudo docker restart frpc
```
