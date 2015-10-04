#!/bin/bash

cwd=$1
# 回到脚本所在目录
cd "$cwd"

# 安装rabbitmq
dpkg -i ../files/software/rabbitmq-server_3.3.4-1_all.deb

# 安装nodejs
mkdir -p "$cwd"/../files/software/node-v0.12.7-linux-x86/
tar -xzvf "$cwd"/../files/software/node-v0.12.7-linux-x86.tar.gz -C "$cwd"/../files/software/

rm -fr /usr/lib/node_modules
cp -rv "$cwd"/../files/software/node-v0.12.7-linux-x86/* /usr/

/usr/bin/npm install -g cnpm --registry=https://registry.npm.taobao.org

/usr/bin/cnpm install --global gulp
