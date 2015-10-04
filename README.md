# VagrantForPhp
PHP Development environment with Vagrant


##安装VirtualBox
虚拟系统运行在VirtualBox中，类似的工具还有VMware，但后者是收费的。

VirtualBox下载地址: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads).

它支持多个平台，请根据自己的情况选择对应的版本。

##安装Vagrant
Vagrant下载地址：[https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html).

选择最新的版本即可。
检查安装是否成功，运行命令：```vagrant```

查看安装版本，运行命令：```vagrant －v```

至此，基本的工具已经安装完成了。

##clone项目

`cd project/path`

`git clone git@github.com:lanffy/VagrantForPhp.git`

##下载vagrant
vagrant下载地址：[https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html)

选择相应的虚拟机版本，此环境预装软件为32系统的软件，如需安装64位的软件则需要自己修改脚本。

将下载好的虚拟机文件如：precise32.box放入files/boxes文件目录中。

##启动vagrant
`vagrant up`
或者执行脚本：`./vagrantup.sh`.

##登录vagrant虚拟机
`vagrant ssh`

##详细步骤
[http://lanffy.github.io/2015/09/28/使用virtualbox_+_vagrant打造属于自己的开发环境1/](http://lanffy.github.io/2015/09/28/使用virtualbox_+_vagrant打造属于自己的开发环境1/)