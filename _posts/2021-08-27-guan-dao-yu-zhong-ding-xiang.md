---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 管道与重定向
date: 2021-08-27 17:38
category: 技术
tags: [unix,管道,重定向]
---



## shell中的管道

```bash
man fork | grep child
```

1. shell先创建子进程A
2. A进程创建管道
3. A进程 fork个子进程B
4. B进程把标准输入STDIN 重定向到管道的读端,也就是子进程负责接收管道中的数据,一般就是 `|` 后面的那个命令
5. A进程把标准输出STDOUT重定向到管道的写端, 负责往管道里写数据,一般就是`|`前面的那个命令

> 管道的创建及重定向都是由shell 来搞定,通过execute来执行命令,两个命令进程就是shell fork后的父子进程 ,共享管道.



![image-20210827180138770](/image/image-20210827180138770.png)





## shell中的重定向

```bash
ls ./ > files.txt
```

![image-20210827180808079](/image/image-20210827180808079.png)
