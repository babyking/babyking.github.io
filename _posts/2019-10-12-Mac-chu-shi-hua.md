---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: Mac初始化
date: 2019-10-09 13:55
category: 技术
tags: [Mac]
---



> 一台合乎自己使用习惯的Mac的一些设置



## 用户名

多台电脑使用同一用户名,方便一些脚本在不同电脑上一致性,虽然然脚本中可以使用$HOME这样的环境变量.



## 效率软件

Karabiner-element

* 配置网盘同步

Alfred

* 剪切板历史 `⌃⌥⌘⇧` + `y`  
* Action`⌃⌥⌘⇧` +  `+`
* Previous Path `⌃⌥⌘⇧` + `-`
* Clipboard 历史的保存时间设置为最大
* 数据网盘同步

Keyboard Maestro

* 配置网盘同步
* 

以上三款软件导入常用配置,配置使用坚果云同步

Shotcat, `⌘⇧` + `space` 



## 输入法

1. 只保留中英两个输入法
2. 在系统设置->键盘中设置两个输入法切换的快捷键(⌃⌥⌘⇧+0),这里的设置跟karabiner中的一键shift切换设置的映射键相同
3. 安装ShowyEdge软件,可以通过顶部颜色块来帮助识别当前输入法状态
4. 中文输入法的shift切换中英文关闭
5. 五笔输入法的拼音混合输入打开



## iTerm2

**/etc/hosts**

设置公司内网ip域名映射

**oh-my-zsh**

**Homebrew**

一般要取消brew install时的update. 放到.bashrc或.zshrc等文件里

```sh
export HOMEBREW_NO_AUTO_UPDATE=true
```

**pyenv**

```sh
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

**rbenv**

```sh
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

**git**

```sh
# git alias
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# git 
git config --global user.email "babyking1949@gmail"
git config --global user.name "babyking"
```

**autojump**

```sh
brew install autojump
# ~/.zshrc中加入autojump
# plugins=(autojump)
```



## Dash

全局选中文字快捷键 `⇧⌘` + `R` ,karabiner中长按 `R` 也映射到此组合.

## Snip

截图快捷键使用 `⌃⌥⌘⇧` + `4`

## Palua

快捷切换function功能键模式,`⌥⌘` + `tab`

### Go2Shell

运行安装



## 其他软件列表

* ShadowsocksX-NG-R8
* Wunderlist
* Nutstore
* 1Password
* 

