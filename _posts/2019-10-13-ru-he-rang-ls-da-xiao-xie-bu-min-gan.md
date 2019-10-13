---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 如何让ls大小写不敏感
date: 2019-10-13 21:37
category: Unix
tags: [ls]
---



在写alfred的插件的时候,需要ls根据通配符列出的文件名不区分大小写.

bash下设置:

```bsh
shopt -s nocaseglob
```

zsh:

```bsh
unsetopt CASE_GLOB
```

yash:

```bsh
set +o case-glob
```