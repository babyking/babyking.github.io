---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: Mac截图使用指南
date: 2019-10-22 14:35
category: Mac
tags: [mac]
---



## 截图触发快捷键

`⌘⇧` +` 3`

截取当前屏幕

`⌘⇧` +` 4`

截取当前选择区域

`⌘⇧` +` 4`+ `space`

截取当前窗口区域



## 选择截取区域

`⌘⇧` +` 4`进入区域截图模式后,有以下几种方式进行区域选择模式.

1. `⌥`

   鼠标所在位置为中心进行扩散

2. `shift`

   宽度不变,纵身向下拉伸

3. `⇧⌥`

   宽度不变,纵身双向(向上,向下)拉伸



## 截图文件设置

```sh
# 保存文件名设置 
defaults write com.apple.screencapture name "screenshot_$(date +%Y%m%d_%H%M%S)"
# 文件名中不包括时间 (默认系统会在文件名末尾增加时间字符串)
defaults write com.apple.screencapture "include-date" 0

# 截图文件格式,type可以为 jpg png
defaults write com.apple.screencapture type [type] && killall SystemUIServer

# 截图保存位置
defaults write com.apple.screencapture location [path] && killall SystemUIServer

# 去除截图四周的阴影
defaults write com.apple.screencapture disable-shadow -bool true && killall SystemUIServer
```



