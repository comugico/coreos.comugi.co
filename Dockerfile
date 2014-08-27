FROM centos:centos7

RUN yum update -y
RUN yum install -y wget tree sudo systemd diffutils patch

RUN mkdir /opt/nginx

RUN wget "http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm" -O "/opt/downloaded.rpm"
RUN yum localinstall -y /opt/nginx/downloaded.rpm
RUN yum install -y nginx

ADD reverseproxy.conf /etc/nginx/conf.d/nginx-reverseproxy-dockerfile.conf
ADD start.sh /opt/nginx/start.sh

EXPOSE 80
WORKDIR /opt/nginx
CMD source /opt/nginx/start.sh