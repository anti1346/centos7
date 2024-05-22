### CentOS Linux 7

##### docker buildx build
```
docker buildx create --use
```
##### docker build & push(Upload to Docker Hub)
```
docker buildx build --tag anti1346/centos7-init:latest -f Dockerfile --platform linux/amd64,linux/arm64 --no-cache --push .
docker buildx build --tag anti1346/centos7:centos7-init -f Dockerfile --platform linux/amd64,linux/arm64 --no-cache --push .
```
##### docker pull(Download to Docker Hub)
```
docker pull anti1346/centos7-init:latest
```
##### Architecture 확인
```
docker inspect anti1346/centos7-init:latest --format='{{.Architecture}}'
```

##### 컨테이너 실행 및 액세스(접속)
```
docker run -it --rm --name centos7-init anti1346/centos7-init:latest bash
```

##### Privileged 모드로 컨테이너 실행
```
docker run -d --privileged --name centos7-init anti1346/centos7-init:latest
```
##### 컨테이너에 액세스(접속)
```
docker exec -it centos7-init bash
```