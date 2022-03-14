# tts-docker
docker compose

### 配置镜像源
1.获取阿里云容器镜像加速器地址
访问阿里云容器镜像加速器（需要先进行登录），地址如下:
https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors
2.配置镜像加速器,docker desktop (配置 Docker Engine)
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
  "registry-mirrors": [
    "https://seav9zcq.mirror.aliyuncs.com"
  ]
}
3.重启docker desktop

### docker迁移磁盘
在关闭docker-desktop的情况下再进行操作
1.Docker-desktop在初始化的时候会创建两个wsl子系统，这两个系统文件会默认保存在上述缓存路径下
wsl -l  -v --all

docker-desktop：保存的是程序
docker-desktop-data: 保存的镜像
2.备份命令
wsl --export docker-desktop docker-desktop.tar
wsl --export docker-desktop-data docker-desktop-data.tar
删除命令
wsl --unregister docker-desktop
wsl --unregister docker-desktop-data
导入命令
wsl --import docker-desktop D:\Repository\Docker\docker-desktop docker-desktop.tar --version 2
wsl --import docker-desktop-data D:\Repository\Docker\docker-desktop-data docker-desktop-data.tar --version 2

### docker-compose 

### 容器自启动
docker ps -aq

docker update f5c1717e568e --restart=no
docker update f3d8f3913ce7 --restart=no
docker update 8c6adfd7abee --restart=no
docker update 370d6e863461 --restart=no
docker update 451172e0f003 --restart=no
docker update d99684eabbc5 --restart=no
docker update 042d2f851c5b --restart=no
docker update e3daa59b0cb2 --restart=no