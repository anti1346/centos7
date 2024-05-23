### CentOS Linux 7

##### docker buildx build
```
docker buildx create --use
```
##### docker build & push(Upload to Docker Hub)
```
docker buildx build --tag anti1346/centos7:init --platform linux/amd64,linux/arm64 --no-cache --push .
```
```
docker buildx build --tag anti1346/centos7-init:latest --platform linux/amd64,linux/arm64 --no-cache --push .
```
##### docker pull(Download to Docker Hub)
```
docker pull anti1346/centos7:init
```
##### Architecture 확인
```
docker inspect anti1346/centos7:init --format='{{.Architecture}}'
```
##### 컨테이너 실행 및 액세스(접속)
```
docker run -it --rm --name centos7-init anti1346/centos7:init bash
```
##### Privileged 모드로 컨테이너 실행
```
docker run -d --privileged --name centos7-init anti1346/centos7:init /sbin/init
```
```
docker run -d --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name centos7-init anti1346/centos7:init /sbin/init
```
##### 컨테이너에 액세스(접속)
```
docker exec -it centos7-init /bin/bash
```

<details>
<summary>Docker Build</summary>
```
docker build --tag anti1346/centos7:init --no-cache .
```
```
docker push anti1346/centos7:init
```
</details>