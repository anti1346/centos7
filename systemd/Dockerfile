FROM centos:centos7

LABEL website="sangchul.kr"

ARG SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD:-root}

ENV SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD}
ENV TZ=Asia/Seoul

USER root

RUN sed -i "s/mirrorlist=/#mirrorlist=/g" /etc/yum.repos.d/CentOS-* \
    && sed -i "s|#baseurl=http://mirror.centos.org|baseurl=https://mirror.kakao.com|g" /etc/yum.repos.d/CentOS-*

RUN yum install -y epel-release \
    && yum install -y systemd \
        initscripts \
        sudo \
        passwd \
        shadow-utils \
        yum-utils \
        procps \
        iputils \
        tar \
        net-tools \
        bind-utils \
        curl \
        wget \
        nc \
        openssh-server \
        # vim \
        # git \
    && yum clean all \
    && rm -rf /var/cache/yum/* /tmp/* /var/tmp/*

RUN rm -f /lib/systemd/system/sysinit.target.wants/* \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    && rm -f /etc/systemd/system/*.wants/* \
    && rm -f /lib/systemd/system/local-fs.target.wants/* \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /lib/systemd/system/basic.target.wants/* \
    && rm -f /lib/systemd/system/anaconda.target.wants/* \
    && rm -f /etc/security/limits.d/20-nproc.conf \
    && echo $TZ > /etc/timezone

RUN echo "root:$SSH_ROOT_PASSWORD" | chpasswd \
    && echo 'export PS1="\[\e[33m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:\[\033[01;31m\]\W\[\e[m\]$ "' >> ~/.bashrc

# Expose SSH port
EXPOSE 22

# Start SSH service and systemd
# CMD ["/usr/lib/systemd/systemd"]
CMD ["/usr/lib/systemd/systemd", "&&", "systemctl", "--now", "enable", "sshd"]
