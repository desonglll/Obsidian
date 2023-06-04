---
title: docker-commands
date: 2022/12/28/ 14:02:02
discription:
---

- [Docker](#docker)
  - [设置镜像源](#设置镜像源)
  - [删除镜像](#删除镜像)
  - [删除容器](#删除容器)
  - [Docker save](#docker-save)
- [Docker-compose](#docker-compose)
  - [docker-compose ports 和 expose 的区别详解](#docker-compose-ports和expose的区别详解)
- [一、docker 保存镜像](#一docker保存镜像)
  - [1.1 首先查看下现有容器镜像（目的是查询需要保存镜像的 ID）](#11-首先查看下现有容器镜像目的是查询需要保存镜像的id)
  - [1.2 接下来用 commit 参数进行保存镜像（精简版）](#12-接下来用commit参数进行保存镜像精简版)
  - [1.3 查看镜像是否保存成功](#13-查看镜像是否保存成功)
- [二、打包 tar](#二打包tar)
- [三、加载 tar 镜像](#三加载tar镜像)
- [Docker push](#docker-push)

## Docker

<https://blog.csdn.net/weixin_47284857/article/details/123876032>

### 设置镜像源

**Docker 设置镜像源**

**1、镜像源介绍**

- 当运行容器时，使用的镜像如果在本地中不存在，就会自动从 docker 镜像仓库中下载，默认从 Docker Hub(<https://hub.docker.com/> )公共镜像源下载；
- 为加快拉取镜像速度，建议设置 docker 国内镜像源；

**2、修改 docker 下载的镜像源**

- ①. 修改文件（没有则新增）
  - touch /etc/docker/daemon.json
  - vim /etc/docker/daemon.json
- ②. 添加或修改如下内容

```json
{
  "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]
}
```

```json
{
  "registry-mirrors": [
    "http://hub-mirror.c.163.com",
    "https://docker.mirrors.ustc.edu.cn",
    "https://registry.docker-cn.com",
    "https://mirror.ccs.tencentyun.com"
  ]
}
```

![img](https://img2020.cnblogs.com/blog/1425104/202201/1425104-20220105154621545-119871238.png)

**3、Docker 国内镜像源**

- Docker 中国区官方镜像:[https://registry.docker-cn.com](https://registry.docker-cn.com/)
- 网易:[http://hub-mirror.c.163.com](http://hub-mirror.c.163.com/)
- ustc:[https://docker.mirrors.ustc.edu.cn](https://docker.mirrors.ustc.edu.cn/)
- 中国科技大学:[https://docker.mirrors.ustc.edu.cn](https://docker.mirrors.ustc.edu.cn/)
- 阿里云:<https://cr.console.aliyun.com/>

修改镜像源

https://www.jiangzhuolin.com/4594.html

选择设置-> Docker Engine ->编辑 json

```json
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "experimental": false,
  "features": {
    "buildkit": true
  },
  "registry-mirrors": ["http://hub-mirror.c.163.com"]
}
```

重点是将镜像仓库设置进去

```json
"registry-mirrors": [
    "http://hub-mirror.c.163.com"
  ]
```

然后点击 apply 即可。
几个速度比较快的镜像地址:
Docker 官方中国区: <https://registry.docker-cn.com>
网易: <http://hub-mirror.c.163.com>
中科大: <https://docker.mirrors.ustc.edu.cn>
————————————————
原文链接：<https://blog.csdn.net/w_monster/article/details/120151735>

### 删除镜像

`docker rmi` 时指定名称

```bash
docker rmi springboot:latest
```

强制删除 增加 `-f` 参数

```bash
docker rmi -f ed603a4c67bb
```

### 删除容器

删除容器使用 docker rm 命令

1)首先需要停止所有的容器

```bash
docker stop $(docker ps -a -q)
```

2)删除所有的容器(只删除单个时把后面的变量改为 container id 即可)

```bash
docker rm $(docker ps -a -q)
```

### Docker save

```bash
docker save [image name] > [saved name].tar
```

## Docker-compose

<https://www.runoob.com/docker/docker-compose.html>

### docker-compose ports 和 expose 的区别详解

docker-compose 中有两种方式可以暴露容器的端口：ports 和 expose。

**ports**

ports 暴露容器端口到主机的任意端口或指定端口，用法：

```
ports:

- "80:80" # 绑定容器的80端口到主机的80端口

- "9000:8080" # 绑定容器的8080端口到主机的9000端口

- "443" # 绑定容器的443端口到主机的任意端口，容器启动时随机分配绑定的主机端口号
```

不管是否指定主机端口，使用 ports 都会将端口暴露给主机。

容器中可以运行一些网络应用，要让外部也可以访问这些应用，可以通过 -P（大写） 或 -p （小写） 参数来指定端口映射。

(1) 当使用-P 标记时，Docker 会随机映射一个 49000~49900 的端口到内部容器开放的网络端口。

使用 docker ps 可以看到，本地主机的 49155 被映射到了容器的 5000 端口。此时访问本机的 49155 端口即可访问容器内 web 应用提供的界面。

```
$ sudo docker run -d -P training/webapp python app.py

$ sudo docker ps -l

CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES

bc533791f3f5 training/webapp:latest python app.py 5 seconds ago Up 2 seconds 0.0.0.0:49155->5000/tcp nostalgic_morse
```

同样的，可以通过 docker logs 命令来查看应用的信息。

```
$ sudo docker logs -f nostalgic_morse

* Running on http://0.0.0.0:5000/

10.0.2.2 - - [23/May/2014 20:16:31] "GET / HTTP/1.1" 200 -

10.0.2.2 - - [23/May/2014 20:16:31] "GET /favicon.ico HTTP/1.1" 404 -
```

(2) -p（小写）则可以指定要映射的 IP 和端口，但是在一个指定端口上只可以绑定一个容器。支持的格式有 hostPort:containerPort、ip:hostPort:containerPort、ip::containerPort。

**expose**

expose 暴露容器给 link 到当前容器的容器，用法：

```
expose:
- "3000"
- "8000"
```

以上指令将当前容器的端口 3000 和 8000 暴露给 link 到本容器的容器。

和 ports 的区别是，expose 不会将端口暴露给主机。

## 一、docker 保存镜像

> 作用：在现在容器镜像上保存镜像进行打包，在另一台服务上使用；或现有的容器安装了一些库，配置了开发环境，需要保存下载，下次加载后直接使用。

### 1.1 首先查看下现有容器镜像（目的是查询需要保存镜像的 ID）

```
docker ps -a
```

### 1.2 接下来用 commit 参数进行保存镜像（精简版）

```
docker commit  7ca736d99653    yolov5:v6.2
```

其中，7ca736d99653 是需要保存镜像的 ID，刚才用 docker ps -a 查询到的。

yolov5:v6.2 是需要保存镜像的 REPOSITORY、和 TAG，这两个自由设定的。（yolov5 对应 REPOSITORY、v6.2 对应 TAG；两者用：分割开。）

（详细版）或者用 commit 参数进行保存镜像， -a 提交人的姓名 -m “提交内容”，格式如：docker commit -a -m 现有容器 ID 保存后的名称：版本号

```
 docker commit -a "xiaoming" -m "Update target detection model" 7ca736d99653 yolov5:v6.2
```

### 1.3 查看镜像是否保存成功

```
docker images
```

能看到刚才保存的镜像 yolov5:v6.2 出现了，说明成功了。

## 二、打包 tar

使用 save 参数进行打包，格式如：docker save -o tar 文件名称 镜像 REPOSITORY:TAG

```
docker save -o yolov5-v6.2.tar yolov5:v6.2
```

其中 yolov5:v6.2 是需要保存镜像的 REPOSITORY、和 TAG；也是上面保存的镜像名称。

## 三、加载 tar 镜像

使用 load 进行从 tar 文件导出镜像

```
docker load -i yolov5-v6.2.tar
```

然后查看是否出现镜像

```
docker  images
```

原文链接：https://blog.csdn.net/qq_46416934/article/details/126327382

## Docker push

```
docker tag danielszabo99/microbin desonglll/microbin
docker push desonglll/microbin
```
