---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 理解互斥锁和条件变量
date: 2021-09-03 16:42
category: Linux
tags: [互斥锁,条件变量]
---



## 互斥量

互斥量,也叫互斥锁,原理很简单,不多赘述.

```c
mutex //全局变量

//Thread A
加锁 mutex
  echo "hello"  
解锁 mutex
  
//Thread B 
加锁 mutex
  echo "world"
解锁 mutex
```

上面的echo是对标准输出为作资源互斥

1. 线程A,B无论谁先获得锁,另外一个获取锁就会失败,阻塞,等待解锁通知并再次尝试获取锁
2. 尝试获取锁可能会有多次并失败,浪费cpu资源

> 互斥锁体现的重点是对资源访问的互斥.  这是的资源是各线(进)程 加锁与解锁之间的部分.



## 条件信号

互斥量只有两种状态,加锁和解锁. 他们是竞争的关系,不停尝试加锁以获得资源.

条件信号是协作关系,条件不满足我先等待(阻塞),待条件满足了通知(发信号)我.

```go
 mutex //互斥量
 con   //条件信号

 ready = false //全局变量

//Thread A
 pthread_mutex_lock(&mutex) //加锁 mutext到wait调用成功之前,不允许对ready条件进行修改。如果这里不加锁mutex的话，有可能在pthread_cond_wait调用未完成（没把当前线程成功放到等待队列）之前，别的线程改变了条件ready, 这个时候Thread A还没有成功进入到等待队列，所以无法被唤醒，也就错过此唤醒信号，Thread会继续阻塞，但此时条件却已经被改变。
 while ready == false {
   			
   	pthread_cond_wait(&cond, &mutex) 
    // wait内部把线程放到等待队列完成后,再解锁mutex,最后一步解锁mutex主要是为了其他线程这时可以获取mutex并得到修改条件变量 ready的机会,然后通过发送con信号来唤醒线程A
    // 线程A被唤醒后先加锁mutex,然后开始新的while判断，如果ready则跳出while,解锁mutex,执行后面的操作。 如果not ready 则继续阻塞等待。
 }
	pthread_mutex_unlock(&mutex) //如果条件 read==true的话,解锁mutext,继续执行条件满足后的操作
  
  
//Thread B
    
 pthread_mutex_lock(&mutex);
		ready = true;    //加解锁mutext之间,Thread A如果要加锁mutex会阻塞
 pthread_mutex_unlock(&mutex);
 pthread_cond_signal(&cond);  //修改ready后给Thread A发送&con信号,这时Thread A 已经被其他信号唤醒且刚好获取锁,那么 while不会运行(不会阻塞),然后解锁mutex 继续运行符合条件后的操作, 如果Thread A还在阻塞,信号con将其唤醒,然后执行后面的操作.
```



