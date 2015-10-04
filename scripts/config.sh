#!/bin/bash

cwd=$1
# 回到脚本所在目录
cd "$cwd"

# 复制字体
mkdir -p /usr/share/fonts/
cp -rv ../files/fonts/* /usr/share/fonts/
chmod -R 0755 /usr/share/fonts/


