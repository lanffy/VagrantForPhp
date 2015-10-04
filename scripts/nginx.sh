#!/bin/bash

cwd=$1
# 回到脚本所在目录
cd "$cwd"

apt-get -y install nginx

cp -rv "$cwd"/../files/nginx/* /etc/nginx/

# 遍历创建连接文件
for file in $(ls "$cwd"/../files/nginx/sites-available/);do
	ln -svf /etc/nginx/sites-available/$file /etc/nginx/sites-enabled/$file 
done

/etc/init.d/nginx restart