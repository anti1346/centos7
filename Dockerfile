FROM centos:centos7

LABEL website="sangchul.kr"

ARG SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD:-root}

ENV SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD}

USER root

RUN yum install -qq -y \
        sudo \
        which \
        curl \
        procps \
        wget \
        ssh \
        # vim \
        # net-tools \
        # iputils-ping \
        # dnsutils \
        # git \

RUN echo "root:$SSH_ROOT_PASSWORD" | chpasswd \
    && cp -rf /etc/skel/.bash* /root/. \
    && echo 'export PS1="\[\033[01;32m\]\u\[\e[m\]\[\033[01;32m\]@\[\e[m\]\[\033[01;32m\]\h\[\e[m\]:\[\033[01;34m\]\W\[\e[m\]$ "' >> ~/.bashrc

CMD ["/usr/bin/bash"]
