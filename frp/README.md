# Docker - Frp

Ref. https://github.com/fatedier/frp
Github https://github.com/antonyxu-git/docker_deployment/tree/main/frp
Docker https://hub.docker.com/repository/docker/antonyxu/frp

## Useage

```bash
sudo docker run -it --rm antonyxu/frp cat /etc/frp/frps.ini > /etc/frp/frps.ini
sudo docker run -it --rm antonyxu/frp cat /etc/frp/frpc.ini > /etc/frp/frpc.ini
```

# 使用已有的配置文件测试
sudo docker run -it --rm --name frps --network host -v /etc/frp:/etc/frp antonyxu/frp:$ARCH frps
sudo docker run -it --rm --name frpc --network host -v /etc/frp:/etc/frp antonyxu/frp:$ARCH frpc

# 开机自动启动添加 --restart=always
sudo docker run -itd --name frps --restart=always --network host -v /etc/frp:/etc/frp antonyxu/frp:$ARCH frps
sudo docker run -itd --name frpc --restart=always --network host -v /etc/frp:/etc/frp antonyxu/frp:$ARCH frpc

# 控制指令
sudo docker start frpc
sudo docker stop frpc
sudo docker restart frpc


