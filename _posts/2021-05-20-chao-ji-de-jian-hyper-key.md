---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 超级键 Hyper Key
date: 2021-05-20 14:53
category: 快捷的键
tags: [快捷的键]
---



## 什么是Hyper Key

Hyper key,超级键, 在现在的键盘上并没有这样一个实体键.

它现在更多的是一种概念, 在软件中大多数重要的功能通过Hyper键与其他键组合而来. 比如著名的Emacs中的Ctrl+x,Vim中可以自己定义Leader键也属于hyper key.



## Mac上的Hyper Key

在Mac上的 ⌃⌥⌘⇧  叫做修饰键,  下面的内容本质上都跟2012年的这篇文章相关.

[A Modern Space Cadet / Steve Losh](https://stevelosh.com/blog/2012/10/a-modern-space-cadet/)

这篇文章中给出了一个重要的概念,定义一个全局的hyper键

1. 将 **⌃⌥⌘⇧** 这四个键映射绑定到 capslock 
2. 通过 capslock + key 来自定义自己的快捷键.
3. 单击capslock直接映射到ESC



说下作者的基本思路, capslock是一个位置非常重要的键,用于大小写切换太浪费,把四个系统修饰键映射到这个键,然后通过capslock键跟其他键组合,就可以组合出无冲突的快捷键,因为几乎没有软件的快捷键是有四个修饰键的.

![image-20210520151433251](/image/image-20210520151433251.png)





这里的capslock键我们就将其叫做Hyper Key.



## 改进的Hyper Key

上面的文章是2012年的,其中软件和配置都很老了.

另外将capslock键作为hyper key也有几个缺点.

1. 小指是几个手指中力量最弱的.
2. , 只能左手操作,像⌘键一样,有左右两个,可以方便的双后操作.



为此,我们定义一对hyper key.  

![image-20210520152031507](/image/image-20210520152031507.png)

将 `Tab` 和 `\` 键定义为左右Hyper键. 方便左右手进行操作, 一般用左右手的无名指,当然如果你习惯小指也可以.

这一对快捷在外置机械键盘上操作更为舒适,因为外置键盘的 `\`键要比自带的键长一些.

![image-20210520152406709](/image/image-20210520152406709.png)

另外再加一对hyper key `G` 和`H`

![image-20210520152538272](/image/image-20210520152538272.png)



为什么要加这两个, 这两个键对于打字模式更方便,使用更有力量的食指,且移动距离最短.

一共四个键,它们的映射都是四个修饰键  **⌃⌥⌘⇧**

![image-20210520152832146](/image/image-20210520152832146.png)



## 实现



Karabiner配置文件: [下载](https://babyking.github.io/lazytips/karabiner/lrzz.json)

如何使用上面的配置文件请参考这里: [Karabiner Elements配置文件导入及使用](https://babyking.github.io/%E5%BF%AB%E6%8D%B7%E7%9A%84%E9%94%AE/2021/05/12/karabiner-pei-zhi-wen-jian-dao-ru-ji-shi-yong.html)



![image-20210520152945783](/image/image-20210520152945783.png)

![image-20210520153020562](/image/image-20210520153020562.png)



## 应用

