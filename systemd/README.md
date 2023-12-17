# CentOS 7

#### CentOS Linux 7(systemd)
##### docker build
```
docker build -t anti1346/centos7:systemd -f Dockerfile.systemd --no-cache --load .
```
##### docker push(Upload to Docker Hub)
```
docker push anti1346/centos7:systemd
```
##### Privileged 모드로 컨테이너 실행
```
docker run -d --privileged --name centos7-systemd anti1346/centos7:systemd
```
##### 컨테이너에 액세스(접속)
```
docker exec -it centos7-systemd bash
```
##### Privileged 모드로 컨테이너 실행 후 컨테이너에 액세스(접속)
```
docker run -it --rm --privileged --name centos7-systemd anti1346/centos7:systemd bash
```
