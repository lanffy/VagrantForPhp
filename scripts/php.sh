#!/bin/bash

cwd=$1
# 回到脚本所在目录
cd "$cwd"

apt-get -y install php-pear php5-cli php5-common php5-curl php5-dev php5-gd php5-fpm php5-imagick php5-memcache php5-memcached php5-mysqlnd php5-xdebug php5-zmq php5-mcrypt php5-redis 

# 复制配置文件
cp -rv "$cwd"/../files/php5/* /etc/php5/

# 安装 libevent
apt-get -y install libevent-dev

mkdir -p "$cwd"/../files/software/libevent-0.1.0/
tar -xzvf "$cwd"/../files/software/libevent-0.1.0.tar.gz -C "$cwd"/../files/software/libevent-0.1.0/

cd "$cwd"/../files/software/libevent-0.1.0/
phpize
./configure --prefix=/usr/bin
make clean
make -j
make install
make clean
ln -svf /etc/php5/mods-available/libevent.ini /etc/php5/cli/conf.d/20-libevent.ini
ln -svf /etc/php5/mods-available/libevent.ini /etc/php5/fpm/conf.d/20-libevent.ini

# 安装msgpack
apt-get -y install libmsgpack-dev

mkdir -p "$cwd"/../files/software/msgpack-0.5.5/
tar -xzvf "$cwd"/../files/software/msgpack-0.5.5.tar.gz -C "$cwd"/../files/software/msgpack-0.5.5/

cd "$cwd"/../files/software/msgpack-0.5.5/
phpize
./configure --prefix=/usr/bin
make clean
make -j
make install
make clean
ln -svf /etc/php5/mods-available/msgpack.ini /etc/php5/cli/conf.d/20-msgpack.ini
ln -svf /etc/php5/mods-available/msgpack.ini /etc/php5/fpm/conf.d/20-msgpack.ini

# 安装xhprof
mkdir -p "$cwd"/../files/software/xhprof-master/
tar -xzvf "$cwd"/../files/software/xhprof-master.tar.gz -C "$cwd"/../files/software/xhprof-master/

cd "$cwd"/../files/software/xhprof-master/extension/
phpize
./configure --prefix=/usr/bin
make clean
make -j
make install
make clean
ln -svf /etc/php5/mods-available/xhprof.ini /etc/php5/cli/conf.d/20-xhprof.ini
ln -svf /etc/php5/mods-available/xhprof.ini /etc/php5/fpm/conf.d/20-xhprof.ini

# 重启服务
/etc/init.d/php5-fpm restart
