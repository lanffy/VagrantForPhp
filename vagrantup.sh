#!/bin/bash

# 当前目录
cwd=$(cd "$(dirname "$0")"; pwd);
# 到当前目录
cd $cwd

#VAGRANT_NOTIFY_SERVER_PID=$(ps -ef | grep 'vagrant-notify-server' | grep -v grep | awk '{print $2}')

#if [ ! -z "$VAGRANT_NOTIFY_SERVER_PID" ]; then
#	sudo kill -9 $VAGRANT_NOTIFY_SERVER_PID
#fi

#if [ `sudo vagrant plugin list | grep 'vagrant-notify' | wc -l` = "0" ]; then
#	sudo gem install ffi -v '1.9.8'
#	sudo vagrant plugin install vagrant-notify
#fi

status=`vagrant status default | grep 'default' | awk '{print $2}'`
if [ "$status" = "running" ]; then
	vagrant reload --provision
else
	vagrant up --provision
fi


