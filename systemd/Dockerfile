# 공식 CentOS 7 기본 이미지 사용
FROM centos:centos7

# 메타데이터 정보 설정
LABEL website="sangchul.kr"

ARG SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD:-root}

ENV SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD}
ENV TZ=Asia/Seoul

USER root

# CentOS 저장소 설정에서 mirrorlist 주석 처리 및 baseurl 설정
# RUN sed -i "s/mirrorlist=/#mirrorlist=/g" /etc/yum.repos.d/CentOS-* \
#     && sed -i "s/#baseurl=http:\/\/mirror.centos.org/baseurl=https:\/\/mirror.kakao.com/g" /etc/yum.repos.d/CentOS-*
#     && sed -i "s/#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-*

# systemd를 포함한 필수 패키지 설치
RUN yum install -y epel-release \
    && yum install -y systemd \
        initscripts \
        sudo \
        passwd \
        shadow-utils \
        yum-utils \
        procps \
        net-tools \
        iputils-ping \
        dnsutils \
        curl \
        # wget \
        # tar \
        # openssh-server \
        # vim \
        # git \
    && yum clean all \
    && rm -rf /var/cache/yum/* /tmp/* /var/tmp/*

# 불필요한 시스템 파일 정리하기
RUN rm -f /lib/systemd/system/sysinit.target.wants/* \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    && rm -f /etc/systemd/system/*.wants/* \
    && rm -f /lib/systemd/system/local-fs.target.wants/* \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /lib/systemd/system/basic.target.wants/* \
    && rm -f /lib/systemd/system/anaconda.target.wants/* \
    && rm -f /etc/security/limits.d/20-nproc.conf

# 표준 시간대 설정
RUN echo $TZ > /etc/timezone

# root 사용자의 비밀번호를 설정하고 bash 프롬프트를 구성
RUN echo "root:$SSH_ROOT_PASSWORD" | chpasswd \
    && echo 'export PS1="\[\e[33m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:\[\033[01;31m\]\W\[\e[m\]$ "' >> ~/.bashrc

# Enable systemd
CMD ["/usr/lib/systemd/systemd"]


#####
# docker buildx create --use
# docker buildx build --platform linux/amd64,linux/arm64 --tag anti1346/centos7:systemd --no-cache --push .
# docker pull anti1346/centos7:systemd
# docker inspect anti1346/centos7:systemd --format='{{.Architecture}}'
# docker run -d --privileged --name centos-systemd anti1346/centos7:systemd
# docker exec -it centos-systemd bash
