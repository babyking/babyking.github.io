---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 设置vim在iTerm2下的光标
date: 2019-10-04 16:34
category: 技术
tags: vi
---

~/.vimrc 增加下面代码

```vim
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
```

