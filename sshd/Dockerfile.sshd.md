# Docker SSH Server
##### docker buildx build
```
docker buildx create --use
```
##### docker build & load
```
docker buildx build --tag anti1346/centos7:sshd -f Dockerfile.sshd --platform linux/amd64,linux/arm64 --no-cache --load .
```
```
docker buildx build --tag anti1346/centos7:sshd -f Dockerfile.sshd --platform linux/amd64,linux/arm64 --build-arg SSH_USER=centos --build-arg SSH_PASSWORD=centos --no-cache --load .
```
##### docker build & push(Upload to Docker Hub)
```
docker buildx build --tag anti1346/centos7:sshd -f Dockerfile.sshd --platform linux/amd64,linux/arm64 --no-cache --push .
```
##### docker pull(Download to Docker Hub)
```
docker pull anti1346/centos7:sshd
```
##### Architecture 확인
```
docker inspect anti1346/centos7:systemd --format='{{.Architecture}}'
```
##### Privileged 모드로 컨테이너 실행
```
docker run -d --name centos7-sshd anti1346/centos7:sshd
```
##### 컨테이너에 액세스(접속)
```
docker exec -it centos7-sshd bash
```


### Docker Compose Build
##### docker-compose build
```
docker-compose build --no-cache
```
```
docker-compose up -d; docker-compose ps; docker-compose logs -f
```
```
docker-compose up --build -d; docker-compose ps; docker-compose logs -f
```
```
docker-compose exec ssh-server bash
```
##### docker container ip
```
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' centos7-sshd
```
##### ssh access info
centos / centos
