---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: Mac 升级到10.13之后 Cocoapods 不能用(转载)
date: 2020-03-19 09:46
category: 技术
tags: [ruby,cocoapods]
---

MacOS 升级到10.13之后使用 Pod 提示



```jsx
zsh: /usr/local/bin/pod: bad interpreter: /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/bin: no such file or directory
```

原因是系统升级之后使用了2.3的 ruby，但是Cocoapods似乎在link 的时候把地址固定在了2.0，于是就找不到。

Cocoapods推荐的解决方案是重装



```cpp
gem install cocoapods
// or 
brew reinstall cocoapods
```

如果提示



```php
ERROR:  While executing gem ... (Gem::FilePermissionError)
    You don't have write permissions for the /usr/bin directory.
```

就用



```bash
sudo gem install cocoapods -n /usr/local/bin
```

不过[参考5]里提到这种方法不太好。由于看到那篇文章的时候我已经用了 sudo 安装了，就没有尝试他提到的方法。下次可以试试。

# Gem

但重装的时候可能会遇到另一个错误，



```csharp
ERROR:  While executing gem ... (TypeError)
    no implicit conversion of nil into String
```

解决方案：升级 gem`sudo gem update --system`

# 总结

所以总体来说就是:



```bash
sudo gem update --system
sudo gem install cocoapods -n /usr/local/bin
```

两行解决。

------

# Update -- 2017.12.19

试用了一下[参考5]提到的



```undefined
brew install ruby
```

修改 ~/.bash_profile (没有就创建个, 若是 zsh 之类也修改对应的 profile 文件)添加搜寻路径如下



```bash
export PATH=/usr/local/bin:$PATH
```

然后 `source ~/.bash_profile` apply 它之后就可以不使用 sudo 直接`gem install cocoapods`了，感觉确实比 sudo 的方式更优雅。

参考

> 1. [https://github.com/CocoaPods/CocoaPods/issues/6778](https://link.jianshu.com?t=https://github.com/CocoaPods/CocoaPods/issues/6778)
> 2. [https://stackoverflow.com/questions/44396215/cocoapods-not-working-in-macos-high-sierra](https://link.jianshu.com?t=https://stackoverflow.com/questions/44396215/cocoapods-not-working-in-macos-high-sierra)
> 3. [https://github.com/rubygems/rubygems/issues/1668](https://link.jianshu.com?t=https://github.com/rubygems/rubygems/issues/1668)
> 4. [https://stackoverflow.com/questions/2893889/how-do-i-fix-the-you-dont-have-write-permissions-into-the-usr-bin-directory](https://link.jianshu.com?t=https://stackoverflow.com/questions/2893889/how-do-i-fix-the-you-dont-have-write-permissions-into-the-usr-bin-directory)
> 5. [https://blog.argcv.com/articles/4429.c](https://link.jianshu.com?t=https://blog.argcv.com/articles/4429.c)



作者：tsiic
链接：https://www.jianshu.com/p/91f3b9d8f402
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。