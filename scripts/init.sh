#!/bin/bash

# 当前目录
cwd=$(cd "$(dirname "$0")"; pwd);
# 到当前目录
cd $cwd

install_dir="/home/vagrant/autoinstall"
# 创建目录
mkdir -pv "$install_dir"

read_ok() {
	local idfile_r="$install_dir/$1.r"
	# 文件不存在，初始化文件
	if [ ! -e "$idfile_r" ]; then
	    echo 'init' > "$idfile_r"
	fi
	# 判断是否处理过
	if [ "$(cat $idfile_r)" == "ok" ]; then
		echo 1
	else
		echo 0
	fi
}

write_ok() {
	local idfile_r="$install_dir/$1.r"
	echo 'ok' > "$idfile_r"
}

# 修改系统时区
localtime=$(ls -l /etc/localtime | grep 'Asia/Shanghai')
if [ -z "$localtime" ]; then
	ln -svf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
fi
# 让语言设置生效
if [ "$(read_ok 'locale_gen')" == "0" ]; then
	# 设置语言
	cp -rv "$cwd"/../files/etc/locale /etc/default/locale
	export LANGUAGE=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	locale-gen en_US.UTF-8
	dpkg-reconfigure locales
	write_ok 'locale_gen'
fi
# 修改日志配置
if [ "$(read_ok 'rsyslog')" == "0" ]; then
	cp -rv "$cwd"/../files/etc/50-default.conf /etc/rsyslog.d/50-default.conf
	# 重启日志服务
	/etc/init.d/rsyslog restart
	write_ok 'rsyslog'
fi

# 修改DNS
if [ "$(read_ok 'modify_dns')" == "0" ]; then
	/bin/bash "$cwd"/resolv.sh "$cwd"
	#echo '192.168.1.6 mirrors.corp.anjuke.com' >> /etc/hosts
	write_ok 'modify_dns'
fi


# 修改apt源
if [ "$(read_ok 'apt_sources')" == "0" ]; then
	cp -rv "$cwd"/../files/etc/sources.list /etc/apt/sources.list
	apt-key add "$cwd"/../files/ondrej_php5.asc
	# 更新源
	apt-get update
	#apt-get -y dist-upgrade
	write_ok 'apt_sources'
fi

# 修复apt-get
apt-get -y -f install
# 安装软件
if [ "$(read_ok 'install_base_software')" == "0" ]; then
	apt-get -y install vim curl git mysql-client g++ autoconf make cmake erlang-nox
	apt-get -y install libcurl4-gnutls-dev libxml2-dev libpcre++-dev libjpeg8-dev libpng12-dev libfreetype6-dev uuid-dev libtool libncurses5-dev re2c unzip build-essential
	write_ok 'install_base_software'
fi
# 安装php5-fpm
if [ "$(read_ok 'install_php5_fpm')" == "0" ]; then
	/bin/bash "$cwd"/php.sh "$cwd"
	write_ok 'install_php5_fpm'
fi
# 安装nginx
if [ "$(read_ok 'install_nginx')" == "0" ]; then
	/bin/bash "$cwd"/nginx.sh "$cwd"
	write_ok 'install_nginx'
fi
# 编译软件
if [ "$(read_ok 'auto_make')" == "0" ]; then
	/bin/bash "$cwd"/make.sh "$cwd"
	write_ok 'auto_make'
fi
# 设置
if [ "$(read_ok 'auto_config')" == "0" ]; then
	/bin/bash "$cwd"/config.sh "$cwd"
	write_ok 'auto_config'
fi
echo 'vagrant up ok!~~~'
