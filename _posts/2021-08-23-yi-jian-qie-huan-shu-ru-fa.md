---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 一键切换输入法
date: 2021-08-23 11:24
category: 快捷的键
tags: [快捷的键]
---



macOS中可以设置输入法的切换快捷键,但是这个键是个至少2个键及以上的组合键. 

![image-20210823112700801](/image/image-20210823112700801.png)

大部分中文输入法都有中英文输入状态的切换,还提供了一键 `Shift`切换这个状态的快捷键.  这是个非常好的设计 .

也可以一键`Shift`来切换不同的输入法. 只需要实现`Shift` 键单击映射到上面图中切换输入法快捷键就可以了.



## 实现

Karabiner配置文件: [下载](https://babyking.github.io/lazytips/karabiner/lrzz.json)

如何使用上面的配置文件请参考这里: [Karabiner Elements配置文件导入及使用](https://babyking.github.io/%E5%BF%AB%E6%8D%B7%E7%9A%84%E9%94%AE/2021/05/12/karabiner-pei-zhi-wen-jian-dao-ru-ji-shi-yong.html)

![image-20210823113855408](/image/image-20210823113855408.png)

如果你在输入法的设置中启用了shift切换中英文,别忘了把它关了,否则会有冲突

![image-20210823114125759](/image/image-20210823114125759.png)
