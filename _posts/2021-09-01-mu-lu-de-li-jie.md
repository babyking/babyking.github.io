---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 目录的理解
date: 2021-09-01 10:30
category: Linux
tags: [目录]
---

Linux目录权限的理解

### 目录没有r权限

1. 不可列目录的内容,但可以列出目录中的文件及内容
2. 不可以执行ls tree等列目录的命令
3. 可以进入目录 

### 目录没有w权限

1. 不可以在目录中创建,移动,删除文件
2. 可以进入目录
3. 如果没有x权限,只有权限也没办法创建文件

### 目录没有x权限

1. 目录不可进入
2. 如果列目录为空,跟没有r权限提示没有权限不同
3. 目录中的文件也不可被访问
4. 目录中也不可创建文件,即使w权限已经设置

