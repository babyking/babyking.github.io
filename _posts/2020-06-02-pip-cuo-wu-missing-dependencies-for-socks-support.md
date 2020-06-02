---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: pip错误 missing dependencies for SOCKS support
date: 2020-06-02 13:56
category: 开发 
tags: [python,pip,pyenv]
---



pip install 时报以下错误

```sh
ERROR: Could not install packages due to an EnvironmentError: Missing dependencies for SOCKS support.
```



解决	

```sh
unset all_proxy
unset ALL_PROXY
pip install pysocks
```

