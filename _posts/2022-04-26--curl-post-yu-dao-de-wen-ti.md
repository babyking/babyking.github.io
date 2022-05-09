---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title:  curl post遇到的问题
date: 2022-04-26 09:47
category: 技术
tags: [curl,post,alfred]
---



macOS升到12.3后,使用python2的wf运行不了,原因是12.3后苹果去掉了python2, /usr/bin/python 不存在.

经常用的flomo的wf正好是用python2写的,所以准备用其他方式实现.由于只有一个post请求,用curl实现一下.

```sh
curl -X POST -H "Content-Type: application/json" -d \
    '{"content":"$query"}' "https://post请求URL
```



发现$query无法被正确替换.正确的做法是在$query外面再加一层引号

```sh
curl -X POST -H "Content-Type: application/json" -d \
    '{"content":"'$query'"}' "https://	
```

