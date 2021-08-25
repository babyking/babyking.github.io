---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: amix的vimrc指南
date: 2021-08-24 17:30
category: 技术
tags: [vim,vi,vimrc]
---

amix的vimrc使用指南, 配置文件仓库:<https://github.com/amix/vimrc>



## General

* Leader键 `,` 后面大部分的操作都依赖这个键

* 以当前Buffer的目录作为工作目录(CWD), `,cd`

  

## 文件,Buffer

* 快速保存 `,w`

* root权限保存 `,W`

  

* 关闭当前buffer `,bd`

* 关闭所有buffer `,ba`



* 当前window打开上一个buffer `,h`
* 当前window打开下一个buffer `,l`



* 快速打开一个临时文件(~/buffer) `,q`

* 快速打开一个临时markdown文件(~/buffer.md) `,x`

  

## 窗口

* windows切换 `^+hjkl`

  

## Tab

* 新建Tab `,tn`

* 新建Tab使用当前Buffer目录,常用于打开同目录文件 `,te`

  

* 关闭Tab `,tc`

* 关闭其他Tab(只保留当前Tab) `,to`

  

* 切换到下一个Tab `,t,`

* 最近两个Tab切换 `,tl`

* 快速切换tab, `,N`  N取值1-9 

  > 快速切换是自己扩展的,定义在my.vimrc中,切换最方便

  

* 移动当前Tab位置到第几个Tab后 `,tm N`  **重点,N不是移动目标位置,而是第几个tab的后面**



