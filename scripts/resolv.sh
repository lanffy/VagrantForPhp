#!/bin/bash

cwd=$1
# 回到脚本所在目录
cd "$cwd"

# 创建文件
touch /etc/resolvconf/resolv.conf.d/tail

CURR_TIME=`date +'%F %T'`

echo '# '$CURR_TIME > /etc/resolvconf/resolv.conf.d/tail

#echo 'nameserver 192.168.1.100' >> /etc/resolvconf/resolv.conf.d/tail
#echo 'nameserver 192.168.1.98' >> /etc/resolvconf/resolv.conf.d/tail
#echo 'search i.ajkdns.com' >> /etc/resolvconf/resolv.conf.d/tail
# 重启
/etc/init.d/resolvconf restart
