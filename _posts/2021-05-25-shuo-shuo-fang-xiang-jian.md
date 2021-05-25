---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 说说方向键
date: 2021-05-25 13:31
category: 快捷的键
tags: [快捷的键]
---



前面说到了hyper超级键,今天我们开始使用它.



方向键,使用比较频繁,过在文字编辑时, 移动光标,右手需要不停的在方向键和打字键区移动,且距离较长.

![image-20210525135520620](/image/image-20210525135520620.png)

vim编辑器使了H,J,K,L 四个键来代替四个方向键,我们可以借鉴一下.

![image-20210525135901782](/image/image-20210525135901782.png)

通过 Hyper+ H,J,K,L 组合来映射至方向键, 这里的hyper推荐使用 `G`

![image-20210525135817792](/image/image-20210525135817792.png)

这样,打字时临时移动光标将变得更方便.



## 实现

Karabiner配置文件: [下载](https://babyking.github.io/lazytips/karabiner/lrzz.json)

如何使用上面的配置文件请参考这里: [Karabiner Elements配置文件导入及使用](https://babyking.github.io/%E5%BF%AB%E6%8D%B7%E7%9A%84%E9%94%AE/2021/05/12/karabiner-pei-zhi-wen-jian-dao-ru-ji-shi-yong.html)

<img src="/image/image-20210525140128804.png" alt="image-20210525140128804"  />

![image-20210525140529620](/image/image-20210525140529620.png)

> 注意, hyper键定义的选项始终放在最底下,因为放在上面会跟  `hyper + g,h,tab,bashsplash这几个键组合`有冲突.

