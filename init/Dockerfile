FROM centos:7

LABEL website="sangchul.kr"

ARG SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD:-root}

ENV SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD}
ENV container docker
ENV TZ=Asia/Seoul

USER root

RUN yum install -y epel-release \
    && yum install -y \
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

# Install systemd and necessary packages
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN echo "root:$SSH_ROOT_PASSWORD" | chpasswd \
    && echo 'export PS1="\[\e[33m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:\[\033[01;31m\]\W\[\e[m\]$ "' >> ~/.bashrc

# Mount /run/systemd/system
VOLUME ["/sys/fs/cgroup"]

# Expose SSH port
# EXPOSE 22

# Set systemd environment variables
CMD ["/usr/sbin/init"]
# CMD ["/usr/sbin/init", "&&", "systemctl", "--now", "enable", "sshd"]
