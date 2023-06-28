FROM centos:centos7

LABEL website="sangchul.kr"

ARG SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD:-root}

ENV SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD}
ENV TZ=Asia/Seoul

RUN echo $TZ > /etc/timezone

USER root

# RUN sed -i "s/mirrorlist=/#mirrorlist=/g" /etc/yum.repos.d/CentOS-* \
#     && sed -i "s/#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-*

RUN yum install -y sudo passwd shadow-utils openssh-clients net-tools iputils vim which curl procps-ng wget \
    && yum clean all \
    && rm -rf /var/cache/yum

# RUN echo "root:$SSH_ROOT_PASSWORD" | chpasswd \
#     && cp -rf /etc/skel/.bash* /root/. \
#     && echo 'export PS1="\\[\\033[01;32m\\]\\u\\[\\e[m\\]\\[\\033[01;32m\\]@\\[\\e[m\\]\\[\\033[01;32m\\]\\h\\[\\e[m\\]:\\[\\033[01;34m\\]\\W\\[\\e[m\\]\\$ "' >> ~/.bashrc

CMD ["/usr/bin/bash"]
