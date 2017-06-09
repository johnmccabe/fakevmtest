FROM centos/systemd

EXPOSE 22
# EXPOSE 4200

RUN mkdir /root/.ssh; chmod 700 /root/.ssh
# COPY keys/id_rsa /root/.ssh
# RUN chmod 600 /root/.ssh/id_rsa
# COPY keys/id_rsa.pub /root/.ssh/
# RUN chmod 644 /root/.ssh/id_rsa.pub
RUN echo "root:password" | chpasswd
RUN yum -y install openssh-clients openssh-server epel-release ; systemctl enable sshd.service;
# RUN yum -y install openssl shellinabox; yum clean all; systemctl enable shellinaboxd.service

CMD ["/usr/sbin/init"]

# docker run --privileged --name fake -v /sys/fs/cgroup:/sys/fs/cgroup:ro -P -d fake
