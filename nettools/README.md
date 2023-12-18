# CentOS 7
### CentOS Linux 7(netttools)
##### docker buildx build
```
docker buildx create --use
```
##### docker build & push(Upload to Docker Hub)
```
docker buildx build --tag anti1346/centos7:netttools -f Dockerfile.netttools --platform linux/amd64,linux/arm64 --no-cache --push .
```
##### docker pull(Download to Docker Hub)
```
docker pull anti1346/centos7:netttools
```
##### 컨테이너 실행 및 액세스(접속)
```
docker run -it --rm --name centos7-netttools anti1346/centos7:netttools bash
```
##### Architecture 확인
```
docker inspect anti1346/centos7:netttools --format='{{.Architecture}}'
```