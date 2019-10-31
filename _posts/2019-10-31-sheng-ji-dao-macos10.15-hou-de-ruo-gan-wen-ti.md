---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 升级到macOS10.15后的若干问题
date: 2019-10-31 18:00
category: Mac
tags: [mac]
---



## Alfred

blog相关的脚不工作了

```sh
[2019-10-31 17:57:49][action.script] Processing output of 'output.notification' with arg ''
[2019-10-31 17:58:03][trigger.hotkey] Processing output of 'input.keyword' with arg ''
[2019-10-31 17:58:08][trigger.hotkey] Processing output of 'input.keyword' with arg ''
[2019-10-31 17:58:21][input.keyword] Processing output of 'action.script' with arg '关键时候能救命 'xattr -cr /path/to/application.app''
[2019-10-31 17:58:21][ERROR: action.script] xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
[2019-10-31 17:58:21][action.script] Processing output of 'action.script' with arg 'git pull error:
'
[2019-10-31 17:58:21][ERROR: action.script] xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
[2019-10-31 17:58:21][action.script] Processing output of 'output.notification' with arg ''
```

google了一下,给出的解决方法是重装xcode command line

```
xcode-select --install
```



## 有些APP打不开了

```sh
xattr -cr /path/to/application.app
```

这个不能多说了



## 权限

老版本的应用如果没有完全卸载,那么权限项可能已经存在,如果直接替换了新版本的应用,可能需要删除权限再重新添加才能生效.

![screenshot_2019_1031_0614_58](/image/screenshot_2019_1031_0614_58.png)