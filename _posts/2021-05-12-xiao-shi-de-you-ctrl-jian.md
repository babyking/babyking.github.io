---

typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 寻找消失的右Ctrl键
date: 2021-05-12 10:51
category: 快捷的键
tags: [快捷的键]
---



Macbook键盘上⌘⌥⇧都是成对出现的,唯独ctrl键例外,显然是没地方了.   



![image-20210512105754346](/image/image-20210512105754346.png)



只有一个ctrl键,无法左右(手)开工很不方便,特别macOS系统还自带emacs的快捷键,像ctrl+a(回到行首),ctrl+e(回到行尾)更是别扭.有些人把capslock映射成了ctrl键来缓解这个问题,5个手指中小指最弱,显然这不是最优解.



这个问题折腾了我很久,不过最终想到了下面这个办法. 

![image-20210512111333295](/image/image-20210512111333295.png)



简单说下思路,就是把 **⇧⌃⌥⌘** 四个修饰键分别映射到 左手的 **ASDF** 和右手的 **;LKJ**  这8个键上,键的顺序与键盘下面的**⌘⌃⌥⇧**四个键顺序一至,下面举例说明使用.

1. 长按F触发 ⌘,此时右手可按其他键完成 ⌘+key

2. 长按L触发⌃,左手可按键完成 ⌃+key

3. 长按`ASDF`或`JKL;`中任意2键或3键

   同时长按下`DF` 触发 `⌘⌥`

   同时长按`SDF`触发 `⌃⌥⌘`

   同时长按`ASD`触发`⇧⌃⌥`

   同时长按`JK`触发`⌘⌥`

   其他同理.



除了解决macbook键盘右侧缺失的ctrl键问题,在打字场景下的快捷键操作也更为方便,,并且**这8个键的位置就是打字时的手的默认位置**,不需要眼睛辅助定位,直接盲操作.



## 实现

Karabiner配置文件: [下载](https://babyking.github.io/lazytips/karabiner/lrzz.json)

如何使用上面的配置文件请参考这里: [Karabiner Elements配置文件导入及使用](https://babyking.github.io/%E5%BF%AB%E6%8D%B7%E7%9A%84%E9%94%AE/2021/05/12/karabiner-pei-zhi-wen-jian-dao-ru-ji-shi-yong.html)



![image-20210512131854564](/image/image-20210512131854564.png)

![image-20210512131923311](/image/image-20210512131923311.png)