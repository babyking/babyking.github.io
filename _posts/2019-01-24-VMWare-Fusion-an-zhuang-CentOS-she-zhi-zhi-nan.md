---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: VMware Fusion安装CentOS设置
date: 2019-01-24 13:49
category: 开发
tags: [vmware,centos]
---



## 安装vm-tools

vm-tools更方便在宿主与虚拟机的切换,数据共享

```shell
yum install -y open-vm-tools
reboot
```

## 网络配置

 选择以Nat网络方式,手动设置CentOS网络配置

编辑 /etc/sysconfig/network-script/ifcfg-xxx ,

```ini
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.8.250
NETMASK=255.255.255.0
NETWORK=192.168.8.0
GATEWAY=192.168.8.2
DNS1=192.168.8.2 
```

为了从宿主机器ssh到虚拟机还需要做Nat端口映射

编辑 /Library/Preferences/VMware Fusion/vmnet8/nat.conf 

```ini
[incomingtcp]

# Use these with care - anyone can enter into your VM through these...
# The format and example are as follows:
#<external port number> = <VM's IP address>:<VM's port number>
#8080 = 172.16.3.128:80
#宿主机器端口(任意) = 虚拟机ip:虚拟机端口(ssh这是应该是22)
```

