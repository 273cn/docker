FROM centos:6.6
MAINTAINER zhangyh@273.cn 
#COPY ./lnmp1.1-full.tar.gz /tmp/
RUN echo "nameserver 114.114.114.114" > /etc/resolv.conf \
    && yum -y install wget \
    && cd /etc/yum.repos.d/ \ 
    && mv CentOS-Base.repo CentOS-Base.repo.bak \
    && wget http://mirrors.163.com/.help/CentOS6-Base-163.repo \
    && mv CentOS6-Base-163.repo CentOS-Base.repo \
    && wget --no-check-certificate https://api.sinas3.com/v1/SAE_lnmp/soft/lnmp1.1-full.tar.gz \
    && cd /tmp \
    && yum -y install tar \
    && yum -y install gcc\
    && tar zxf lnmp1.1-full.tar.gz \
    && cd lnmp1.1-full \
    && ./centos.sh \
