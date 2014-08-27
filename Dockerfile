FROM centos:centos6

RUN yum update -y
RUN yum install -y make gcc readline-devel zlib-devel nmap
RUN yum install -y wget tar tree sudo

ADD sudoers /etc/sudoers.d/01_docker
RUN chmod 0440 /etc/sudoers.d/01_docker

RUN mkdir /opt/aipo-tmp
RUN mkdir /opt/aipo

RUN wget "http://iij.dl.sourceforge.jp/aipo/60038/aipo7020aja_linux64.tar.gz" -O "/opt/aipo-tmp/downloaded.tar.gz"
ADD install.sh /opt/aipo-tmp/aipo-install.sh
RUN source /opt/aipo-tmp/aipo-install.sh

EXPOSE 80
WORKDIR /opt/aipo
CMD /opt/aipo/bin/startup.sh && tail -f /opt/aipo/tomcat/logs/catalina.out
