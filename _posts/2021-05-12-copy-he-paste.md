---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: Copy和Paste
date: 2021-05-11 13:51
category: 快捷的键
tags: [快捷的键]
---



Copy,Paste 的使用对我来说最为频繁,并且绝大部分都是通过快捷键. ⌘+C,⌘+V 

 

我主要使用以下几种姿势,其他人估计也应该大同小异. 

 

姿势1

<img src="/image/image-20210511115223049.png" alt="image-20210511115223049" style="zoom:50%;" />

姿势2

<img src="/image/image-20210511115317106.png" alt="image-20210511115317106" style="zoom:50%;" />

姿势3

<img src="/image/image-20210511115331606.png" alt="image-20210511115331606" style="zoom:50%;" />



键盘的布局设计原因,几种姿势不够友好,无法做到盲操作.而copy paste用的太频繁,能不能再简单一些?.

 

最终我想的办法就是通过长按C,长按V 实现copy paste.

 

好处就是:

* 在打字模式下,双手不需要离开打字键区

* 在需要较多的copy   paste时,右手鼠标进行选择,左手配合一键C,V操作,盲操作,方便快捷.

 

## 实现

 

1. 下载安装[karabiner elements](https://karabiner-elements.pqrs.org/ ) karabiner是Mac下一款功能强大的键盘映射工具,开源免费.      由于karabiner工作在驱动层,安装过程需要你进行授权,如果你没有授权,也可在系统配置中自行打开.

![image-20210511115438958](/image/image-20210511115438958.png)

2. 下载我的配置文件.[https://babyking.github.io/lazytips/karabiner/lrzz.json](https://babyking.github.io/lazytips/karabiner/lrzz.json) (不定期更新)

​       将这个配置文件copy到 `~/.config/karabiner/assets/complex_modifications/` 下. 

​		Finder下可使用快捷键⌘⇧+G 进入到目录  

![image-20210511115522091](/image/image-20210511115522091.png)

3. 将配置文件中的`一键copy paste`导入到karabiner中.

![image-20210511115535229](/image/image-20210511115535229.png)

 

![image-20210511115555860](/image/image-20210511115555860.png)

 

这时候就可以工作了,试试,是不是比以前更简单了.对了,配置里还加了一键X剪切 ^^.

![image-20210511131513616](/image/image-20210511131513616.png)

