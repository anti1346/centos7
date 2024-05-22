# Use the CentOS 7 base image
FROM centos:7

# Install systemd which will replace the entry point
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done) && \
rm -f /lib/systemd/system/multi-user.target.wants/* && \
rm -f /etc/systemd/system/*.wants/* && \
rm -f /lib/systemd/system/local-fs.target.wants/* && \
rm -f /lib/systemd/system/sockets.target.wants/*udev* && \
rm -f /lib/systemd/system/sockets.target.wants/*initctl* && \
rm -f /lib/systemd/system/basic.target.wants/* && \
rm -f /lib/systemd/system/anaconda.target.wants/* && \
yum -y install epel-release; yum -y install epel-release; yum -y install openssh-server; yum -y install initscripts; yum -y install passwd; yum -y install yum-utils; yum -y install wget; yum -y install tar; yum -y install sudo; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*; \
rm -f /etc/systemd/system/*.wants/*; \
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*; \
rm -f /lib/systemd/system/anaconda.target.wants/*; \
rm -f /etc/security/limits.d/20-nproc.conf; \
mkdir -p /root/.ssh; \
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config; \
echo "root:root" | chpasswd; \
chmod 700 /root/.ssh
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
