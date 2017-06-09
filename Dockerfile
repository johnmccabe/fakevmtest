FROM centos/systemd

EXPOSE 80
EXPOSE 22

RUN yum -y install httpd openssh-clients openssh-server ; yum clean all; systemctl enable httpd.service; systemctl enable sshd.service;

CMD ["/usr/sbin/init"]