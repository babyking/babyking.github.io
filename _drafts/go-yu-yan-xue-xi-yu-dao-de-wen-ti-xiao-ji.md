---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: go语言学习遇到的问题小记
date: 2019-10-12 17:22
category: 技术 
tags: [go]
---

提纲:

1. GOPATH的问题

2. go run,build,install的问题,特别是目录

3. go build ,install 生成文件名及路径 

   go build filename.go 指定文件名,可执行文件为文件名(不带扩展名)

   go build 不指定文件名,以目录名为可执行文件名

   包以package定义的名称为主

   以上是否可以指定名称?

   参考 https://blog.csdn.net/u014633283/article/details/83859438

4. import时的目录,包名以及github的用法.

5. 包管理问题.go mod的的使用对以上几点的理解的影响.

6. 包管理的策略 https://xuanwo.io/2019/05/27/go-modules/

7. 使用go mod的代理

8. go mod使用后,历史代码的管理,使用,引入问题

9. 使用go mod后,go build,install的文件名,生成文件的路径及

10. 使用go mod后  src/pkg/bin 这样的目录规范是否还有必要 ?

11. 

