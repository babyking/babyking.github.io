---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: pyinstaller 在macOS下安装
date: 2020-06-11 23:15
category: 技术
tags: [pyenv,pyinstaller]
---

pyinstaller 在macOS使用时需要python使用如下参数进行编译

```shell
Some of 3rd party tool like PyInstaller might require CPython installation built with –enable-framework. You can build CPython with shared library as follows.

$ env PYTHON_CONFIGURE_OPTS=”–enable-framework” pyenv install 3.5.0
```

