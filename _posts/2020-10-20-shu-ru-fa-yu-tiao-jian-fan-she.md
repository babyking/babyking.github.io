---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 输入法与条件反射
date: 2020-10-20 13:26
category: 思考
tags: [输入法]
---

输入法在状态栏上会有个图标,显示当前的输入状态,这样的设计也没什么问题. 不过自从用了`ShowyEdage` 后就不再通过图标状态来判断当前输入法状态.其实 `ShowyEdage`的高明之处在于比图标的显示范围更大,可通过视觉的余光看到.

![image-20201020133032475](/image/image-20201020133032475.png)

>  有颜色的状态为中文输入

我将`shift`设置为一键切换输入法后,使用过程便不再关心当前的输入法状态,直接输入,如果状态不对,直接一键`shift`切换,继续输入.

这算是一种条件反射吧.  也更像是缓存. 不需要每次输入都判断输入法状态,直接使用上次的状态,如果命中,效率大大提高,如果命中失败,也就是一键`shift`的事情,时间上了会成为肌肉记忆.  真的是全新的使用体验.