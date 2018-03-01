编译镜像
```bash
docker build -t wdj/usvn .
```
运行容器
```bash
docker run --restart=always -d -e SVN_DOMAIN="域名" -v /data/usvn:/data --dns 114.114.114.114 --name usvn -p 1818:80 wdj/usvn
```
