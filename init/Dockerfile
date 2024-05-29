FROM centos:7

ENV container docker

# Install systemd and necessary packages
RUN yum -y install epel-release \
    && yum -y install openssh-server initscripts passwd yum-utils wget tar sudo \
    && yum clean all \
    && (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    && rm -f /etc/systemd/system/*.wants/* && \
    && rm -f /lib/systemd/system/local-fs.target.wants/* \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /lib/systemd/system/basic.target.wants/* \
    && rm -f /lib/systemd/system/anaconda.target.wants/* \
    && rm -f /etc/security/limits.d/20-nproc.conf

# Mount /run/systemd/system
VOLUME [ "/sys/fs/cgroup", "/run" ]

# Set systemd environment variables
CMD ["/usr/sbin/init"]
