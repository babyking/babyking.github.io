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

![screenshot_2019_1101_1224_13](/image/screenshot_2019_1101_1224_13.png)



## karabiner-elements

```verilog
[2019-11-01 11:55:11.329] [info] [console_user_server] core_configuration is updated.
[2019-11-01 11:55:11.373] [info] [console_user_server] Check for updates...
[2019-11-01 11:55:12.701] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:12.804] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:14.268] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:14.312] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:15.729] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:15.838] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:17.221] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:17.395] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:18.552] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:18.826] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:19.903] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:20.269] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:21.409] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:21.930] [error] [console_user_server] grabber_client error: No buffer space available

```

karbiner 12.6.0. 偶尔发生,重启后恢复正常. 等新版本看是否修复此问题.



## zip无法解压

![screenshot_2019_1106_0929_33](/image/screenshot_2019_1106_0929_33.png)

使用第三方的keka可以正常解压,不知为何?