# docker systemd

### CentOS Linux 7(systemd)
##### Docker Buildx 생성 및 활성화
```
docker buildx create --use
```
##### docker build & load
```
docker buildx build --tag anti1346/centos7:systemd -f Dockerfile --platform linux/amd64,linux/arm64 --no-cache --load .
```
##### 다중 플랫폼 이미지 빌드 및 레지스트리 푸시(PUSH)
```
docker buildx build --tag anti1346/centos7:systemd -f Dockerfile --platform linux/amd64,linux/arm64 --no-cache --push .
```
##### 이미지 풀(PULL)
```
docker pull anti1346/centos7:systemd
```
##### 빌드된 이미지의 아키텍처 확인
```
docker inspect anti1346/centos7:systemd --format='{{.Architecture}}'
```
##### 컨테이너 실행(RUN)
```
docker run -d --privileged --name centos7-systemd anti1346/centos7:systemd
```
##### 컨테이너에 Bash 셸 실행(EXEC)
```
docker exec -it centos7-systemd bash
```
#### ssh access info
```
root / root
```


<details>
<summary>Docker Compose 코드</summary>

## docker-compose
#### docker-compose build

```
docker-compose build --no-cache
```
```
docker-compose up -d; docker-compose ps; docker-compose logs -f
```
```
docker-compose up --build -d; docker-compose ps; docker-compose logs -f
```

###### docker container ip
```
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh-server
```

<details>
<summary>README 백업</summary>

</details>
