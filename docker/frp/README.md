# Docker - Frp

- Ref. https://github.com/fatedier/frp
- Github https://github.com/antonyxu-git/docker_deployment/tree/main/frp
- Docker https://hub.docker.com/repository/docker/antonyxu/frp

## Useage

Put your configuration files (`frps.ini` or `frpc.ini`) in a folder (such as `/etc/frp`).
In addition, you can get the sample configuration in the following ways:

```bash
mkdir -p $HOME/conf/frp
sudo docker run -it --rm antonyxu/frp cat /etc/frp/frps.ini > $HOME/conf/frp/frps.ini
sudo docker run -it --rm antonyxu/frp cat /etc/frp/frpc.ini > $HOME/conf/frp/frpc.ini
```

Run

```bash
# run
sudo docker run -it --rm --network host -v $HOME/conf/frp:/config antonyxu/frp frps
sudo docker run -it --rm --network host -v $HOME/conf/frp:/config antonyxu/frp frpc

# daemon
sudo docker run -itd --name frps --restart=always --network host -v $HOME/conf/frp:/config antonyxu/frp frps
sudo docker run -itd --name frpc --restart=always --network host -v $HOME/conf/frp:/config antonyxu/frp frpc

# others
sudo docker start frpc
sudo docker stop frpc
sudo docker restart frpc
```
