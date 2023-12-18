# CentOS 7

#### CentOS Linux 7(systemd)
##### docker buildx build
```
docker buildx create --use
```
##### docker build & load
```
docker buildx build --tag anti1346/centos7:systemd -f Dockerfile.systemd --platform linux/amd64,linux/arm64 --no-cache --load .
```
##### docker build & push(Upload to Docker Hub)
```
docker buildx build --tag anti1346/centos7:systemd -f Dockerfile.systemd --platform linux/amd64,linux/arm64 --no-cache --push .
```
##### docker pull(Download to Docker Hub)
```
docker pull anti1346/centos7:systemd
```
##### Privileged 모드로 컨테이너 실행
```
docker run --privileged -d --name centos7-systemd anti1346/centos7:systemd /sbin/init
```
##### 컨테이너에 액세스(접속)
```
docker exec -it centos7-systemd bash
```
##### Architecture 확인
```
docker inspect anti1346/centos7:systemd --format='{{.Architecture}}'
```