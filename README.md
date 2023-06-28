# CentOS 7

#### CentOS Linux 7
##### docker build
```
docker build -t anti1346/centos7:latest . --no-cache
```
##### docker push(Upload to Docker Hub)
```
docker push anti1346/centos7:latest
```
##### 컨테이너 실행 및 액세스(접속)
```
docker run -it --rm anti1346/centos7:latest bash
```

##### Privileged 모드로 컨테이너 실행
```
docker run -d --privileged --name centos7 anti1346/centos7:latest
```
##### 컨테이너에 액세스(접속)
```
docker exec -it centos7 bash
```
##### Privileged 모드로 컨테이너 실행 후 컨테이너에 액세스(접속)
```
docker run -it --rm --privileged --name centos7 anti1346/centos7:latest bash
```
