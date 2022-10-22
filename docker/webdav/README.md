# Docker - webdav

- Github https://github.com/antonyxu-git/docker_deployment/tree/main/webdav
- Docker https://hub.docker.com/repository/docker/antonyxu/webdav

## Useage

```
webdav [options]
-u username default:admin
-p password default:admin
-f file_owner default:33 (www-data)
-m mount_path default:/data
-a allow_browse default:false
```

Run

```bash
# run
sudo docker run -it --rm -p 8001:80 -v /data:/data antonyxu/webdav webdav
# or
sudo docker run -it --rm -p 8001:80 -v /data:/data antonyxu/webdav \
    webdav -u admin -p admin -f 33 -m /data -a

# daemon
sudo docker run -itd --name webdav --restart=always -p 8001:80 -v /data:/data antonyxu/webdav
# or
sudo docker run -itd --name webdav --restart=always -p 8001:80 -v /data:/data antonyxu/webdav webdav -u user -p passwd

# others
sudo docker start webdav
sudo docker stop webdav
sudo docker restart webdav
```
