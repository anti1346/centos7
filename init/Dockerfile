FROM centos:7

LABEL website="sangchul.kr"

ARG SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD:-root}

ENV SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD}
ENV TZ=Asia/Seoul

RUN yum install -y epel-release && \
    yum install -y systemd openssh-server initscripts passwd yum-utils wget tar sudo && \
    yum clean all && \
    rm -rf /var/cache/yum/* /tmp/* /var/tmp/* && \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) && \
    rm -f /lib/systemd/system/multi-user.target.wants/* && \
    rm -f /etc/systemd/system/*.wants/* && \
    rm -f /lib/systemd/system/local-fs.target.wants/* && \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* && \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* && \
    rm -f /lib/systemd/system/basic.target.wants/* && \
    rm -f /lib/systemd/system/anaconda.target.wants/* && \
    rm -f /etc/security/limits.d/20-nproc.conf && \
    mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh && \
    echo "root:${SSH_ROOT_PASSWORD}" | chpasswd && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 22

VOLUME ["/sys/fs/cgroup"]

CMD ["/usr/sbin/init"]
