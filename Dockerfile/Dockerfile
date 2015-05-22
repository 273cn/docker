FROM centos:6.6
MAINTAINER zhangyh@273.cn 
COPY ./lnmp1.1-full.tar.gz /tmp/ 
COPY ./zend-loader-php5.5-linux-x86_64.tar.gz /tmp/ 
RUN echo "nameserver 114.114.114.114" > /etc/resolv.conf \
    && yum -y install wget \
    && cd /etc/yum.repos.d/ \ 
    && mv CentOS-Base.repo CentOS-Base.repo.bak \
    && wget http://mirrors.163.com/.help/CentOS6-Base-163.repo \
    && mv CentOS6-Base-163.repo CentOS-Base.repo \
#    && wget --no-check-certificate https://api.sinas3.com/v1/SAE_lnmp/soft/lnmp1.1-full.tar.gz \
    && cd /tmp \
    && yum -y install tar \
    && yum -y install gcc\
    && tar zxf lnmp1.1-full.tar.gz \
    && cd lnmp1.1-full \
    && ./centos.sh \
    && sed -i 's/read -p "(Please input PHP Version you want):" php_version/php_version="5.5.20"/g' ./upgrade_php.sh \
    && ./upgrade_php.sh \
    && rm -rf /tmp/lnmp1.1-full.tar.gz \
    && rm -rf /tmp/lnmp1.1-full \
#change lnmp start
    && sed -i 's/\/etc\/init.d\/mysql/#\/etc\/init.d\/mysql/g' /root/lnmp \
    && sed -i 's/killall mysqld/#killall mysqld/g' /root/lnmp \
#redis extension
    && cd /tmp \
    && wget http://pecl.php.net/get/redis-2.2.5.tgz \
    && tar zxvf redis-2.2.5.tgz \
    && cd redis-2.2.5 \
    && phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make \
    && make install \
    && sed -i '/the dl()/i extension = "redis.so"' /usr/local/php/etc/php.ini  \
# xdebug install
    && wget http://pecl.php.net/get/xdebug-2.2.2.tgz \
    && tar zxvf xdebug-2.2.2.tgz \
    && cd xdebug-2.2.2 \
    && phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config  \
    && make \ 
    && make install \
    && sed -i '$a [xDebug]\n zend_extension= /usr/local/php/lib/php/extensions/no-debug-non-zts-20121212/xdebug.so' /usr/local/php/etc/php.ini \    
#mongo install 
    &&  wget  http://pecl.php.net/get/mongo-1.5.6.tgz \
    && tar zxvf mongo-1.5.6.tgz \
    && cd mongo-1.5.6 \
    && phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make \
    && make install \
    && sed -i '/the dl()/i extension = "mongo.so"' /usr/local/php/etc/php.ini  \
#swoole install
    && wget https://pecl.php.net/get/swoole-1.7.14.tgz \
    && tar zxvf swoole-1.7.14.tgz \
    && cd swoole-1.7.14 \
    && phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make \
    && make install \
    && sed -i '/the dl()/i extension = "swoole.so"' /usr/local/php/etc/php.ini  \
#memcached install 
    && wget https://launchpad.net/libmemcached/1.0/1.0.9/+download/libmemcached-1.0.9.tar.gz \
    && wget        http://pecl.php.net/get/memcached-2.1.0.tgz \
    && tar zxvf libmemcached-1.0.9.tar.gz \
    && cd libmemcached-1.0.9 \
    && ./configure --prefix=/usr/local/libmemcached \
    && make \
    && make install \
    && cd .. \
    && tar zxvf  memcached-2.1.0.tgz \
    && cd memcached-2.1.0 \
    && phpize \
    && ./configure --enable-memcached --with-php-config=/usr/local/php/bin/php-config --with-libmemcached-dir=/usr/local/libmemcached --disable-memcached-sasl \
    && make \
    && make install \
    && sed -i '/the dl()/i extension = "memcached.so"' /usr/local/php/etc/php.ini  \
#yac install \
    && wget http://pecl.php.net/get/yac-0.9.0.tgz \
    && tar zxvf yac-0.9.0.tgz \
    && cd yac-0.9.0 \
    && phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make \
    && make install \
    && sed -i '/the dl()/i extension = "yac.so"' /usr/local/php/etc/php.ini  \
    && sed -i '/the dl()/i  yac.enable = 1 \n yac.keys_memory_size = 32M \n yac.values_memory_size = 128M \n yac.compress_threshold = -1 \n yac.enable_cli = 1 \n'  /usr/local/php/etc/php.ini \
    && cd /tmp \
    &&  tar zxvf zend-loader-php5.5-linux-x86_64.tar.gz \
    && cd zend-loader-php5.5-linux-x86_64 \
    && cp ZendGuardLoader.so /usr/local/zend/ \
    && cp opcache.so /usr/local/zend/ \
    && rm -rf /tmp/zend-loader-php5.5-linux-x86_64* \
#
   
