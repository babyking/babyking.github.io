---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 理解dup和dup2
date: 2021-08-25 16:04
category: 技术
tags: [dup,dup2,重定向]
---



<img src="/image/image-20210825180644941.png" alt="image-20210825180644941" />

dup声明

`int dup(int fd)`

dup返回的文件描述符指向与fd的文件表项, 这样有两个描述符指向同一个文件表项。 一般用于备份重定向前的fd指向的文件表项,可用于后面恢复重定向前的状态. 一般与dup2配合使用. 

dup2的声明

`int dup2(int fd1, int fd2);`

dup2 从字面上理解其实就是把 fd1指向的文件表项复制给了fd2,这样fd2也就都指向了fd1,`但是这样理解有点绕,只是描述了行为本身,没有说清楚目的`. 

 **一句话说就是将对fd2的操作重定向到fd1**  返回不出错的话,则时返回fd2的值,主要用于后面恢复重定向前状态.



典型的场景:

```c
FILE* f; //这里的f也可以是管道等其他文件

int fd_backup = dup(STDOUT_FILENO);
int fd = dup2(f,STDOUT_FILENO); //这里的fd如果不是-1,返回值是第二个参数中的fd值,用于后面恢复到重定向前状态

// 此时对STDOUT的操作重定向到 f

// 恢复重定向前的状态
dup2(fd_backup, fd);
```

