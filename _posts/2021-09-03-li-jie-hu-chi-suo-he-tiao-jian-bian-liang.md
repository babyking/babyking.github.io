---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 理解互斥锁和条件变量
date: 2021-09-03 16:42
category: Linux
tags: [互斥锁,条件变量]
---



## 互斥锁

互斥锁原理很简单,不多赘述.

```c
lock //全局变量

//Thread A
加锁 lock  
  echo "hello"  
解锁 lock
  
//Thread B 
加锁 lock
  echo "world"
解锁 lock
```

上面的echo是对标准输出为作资源互斥

1. 线程A,B无论谁先获得锁,另外一个获取锁就会失败,阻塞
2. 尝试获取锁可能会有多次并失败,浪费cpu资源



## 条件信号
