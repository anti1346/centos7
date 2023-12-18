FROM centos:centos7

LABEL website="sangchul.kr"

# 기본 root 비밀번호 설정
ARG SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD:-root}
ENV SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD}

# 타임존 설정
ENV TZ=Asia/Seoul
RUN echo $TZ > /etc/timezone

# root 사용자로 전환
USER root

# CentOS 저장소 설정에서 mirrorlist 주석 처리 및 baseurl 설정
# RUN sed -i "s/mirrorlist=/#mirrorlist=/g" /etc/yum.repos.d/CentOS-* \
#     && sed -i "s/#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/mirror.kakao.com/g" /etc/yum.repos.d/CentOS-*

# 필수 패키지 설치
RUN yum install -y sudo passwd shadow-utils \
        which net-tools iputils procps-ng \
        curl wget openssh-clients vim \
    && yum clean all \
    && rm -rf /var/cache/yum

# root 비밀번호 설정 및 bash 프롬프트 구성
RUN echo "root:$SSH_ROOT_PASSWORD" | chpasswd \
    && echo 'export PS1="\[\033[01;32m\]\u\[\e[m\]\[\033[01;32m\]@\[\e[m\]\[\033[01;32m\]\h\[\e[m\]:\[\033[01;34m\]\W\[\e[m\]$ "' >> ~/.bashrc

CMD ["/usr/bin/bash"]
