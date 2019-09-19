---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: Duet2罢工了
date: 2018-10-21 20:58
category: 音乐
---



> 问题终于解决,详见文末.



用了好几年的Macbook 重装系统(High Serria)后, 发现 Duet2 罢工了,驱动是官网的2.5版本`duet_2.5.dmg`

不停的提示我需要更新固件,但更新程序显示固件的版本是最新的.

![Xnip2018-10-21_20-55-02](/image/Xnip2018-10-21_20-55-02.jpg)

控制面板也显示找不到设备,声卡的面板一直显示apogee的logo.

![Xnip2018-10-11_22-29-11](/image/Xnip2018-10-11_22-29-11.jpg)

网上搜索无果.但发现我的另一台比较老的Macbook确是正确,也升级到了High Serria,想了想,这台电脑是一个版本一个版本的升上来的,看了下控制程序的版本`2.10.6`,而最新2.5这个版本的驱动对应的版本是`2.10.9`



![Snip20181021_1](/image/Snip20181021_1.png)

顺着这个思路,是不是找到`2.10.6`对应的驱动是否就好了, 可惜官网似乎无法找到对应的版本了.



挖个坑,解决了再来填.



## 解决方案

这一个月时间,google, youtube,论坛各种搜索,发现2个跟我情况一模一样的

`youtube`

[Apogee Duet 2 Not Working/Connecting](https://www.youtube.com/watch?v=wca40hU8mxI&list=LLQYMzCEEC8Or65JVMsg6Ktw&index=2&t=24s)

`Tonymacx86.com`

[Apogee Maestro / Duet2 not working on Sierra Hackintosh](https://www.tonymacx86.com/threads/apogee-maestro-duet2-not-working-on-sierra-hackintosh.207988/)

都没有解决方案.



记得前面我说的另一台电脑可以工作,所以一直都把问题归结为驱动的版本问题,在音频应用论坛上也有朋友给了几个老版本的驱动,问题依然没有解决.

上周日,突然想到MacBookPro笔记本有重装过,而且当时因为看了一篇技术文章,大体意思是说Mac下开发的程序如果最终要在Linux上部署,建议把Mac文件系统改为大小写敏感. 所以我也就顺带着做了这件事情. 会不会是这个导致呢?



​	1.重装OSX 10.11 , 默认安装(文件系统不区分大小写),安装驱动,问题解决.

​	2.从10.11升级至10.13,工作正常.

​	3.直接默认重装macOS 10.13,安装duet2驱动,工作正常.



哈,原来就文件系统的大小写敏感导致的.  Apogee Duet的驱动在大小写敏感的文件系统上无法正常工作,说是驱动的兼容性问题也没毛病.



Duet 复活了,于是终于可以下单 Generic 8010A 了,期待....

