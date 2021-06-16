---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 快速启动切换程序
date: 2021-06-16 15:10
category: 快捷的键
tags: [快捷的键]
---



Mac自带的spotlight以及像Alfred都可以快速启动应用程序.

至于切换程序,当然是 "Command + Tab"了.

![image-20210616151441366](/image/image-20210616151441366.png)



其实很多时候我们并不关心应用是否启动,而只是单纯的想要那个程序切换到前台.  所以,应该有更好的思路.



Option + key 来启动或切换应用程序.

为什么使用option键,因为Mac下的option + key是用来输入特殊的希腊字母的,对中文用户来说几乎没什么用,所以使用option+key来作为快速启动/切换应用程序是最佳选择.

![image-20210616152344401](/image/image-20210616152344401.png)



同时,前面我们在 [超级键HyperKey](https://babyking.github.io/) 一文中有把长按 "D"和"K"键映射到option键,这样我们在打字模式的时候启动和切换应用将变得更为舒适,两只手不需要作任何移动.

![image-20210616152819400](/image/image-20210616152819400.png)



比如,

option+c  映射到Google Chrome

option+t  映射到 iTerm

option+m 映射到 Mail

option+e  映射到 Evernote



## 实现

这次需要使用一个新的工具  HammerSpoon.

具体安装请自行搜索.

HS的配置文件位于  ~/.hammerspoon 目录. 说是配置文件,其实是Lua程序.  其中init.lua 是入口配置程序.  

![image-20210616153508326](/image/image-20210616153508326.png)

1. 将下面的 launch_app.lua 文件copy到 ~/hammerspoon 目录下

2. 在init.lua中引入  

   ```
   require('launch_app')	-- 快速启动app
   ```



当然,直接在init.lua 中直接paste launch_app.lua内容也可以.



```lua
-- launch_app.lua (快速启动应用 option+key)

apps = {
	{'a','Activity Monitor'},
	{'b','clearview'},
	{'c','Google Chrome'},
	{'d','Dictionary'},
	{'e','Evernote'},
	{'f','Finder'},
	{'g','GoLand'},
	-- hjkl预留给光标移动(以词为单位,映射至opton+arrow_key,参考key_remap.lua)
	-- {'h',''},
	-- {'i',''},
	-- {'j',''},
	-- {'k',''},
	-- {'l',''},

	{'m','Mail'},
	{'n','Notes'},
	{'o','Microsoft OneNote.app'},
	{'p','Preview'},
	{'q','QQ'},
	{'r','Reminders'},
	{'s','Sublime Text'},
	{'t','iTerm'},
	-- {'u',''},
	{'v','Visual Studio Code'},
	{'w','WeChat'},
	-- {'x','XCode'},
	-- {'y',''},
	-- {'z',''},
	{',','System Preference'},
	-- {'0',''},
	-- {'1',''},
	-- {'2',''},
	-- {'3',''},
	-- {'4',''},
	-- {'5',''},
	-- {'6',''},
	-- {'7',''},
	-- {'8','RubyMine'},
	-- {'9',''},
}


for _,app in ipairs(apps) do
  hs.hotkey.bind({'alt'},app[1],nil,function() hs.application.launchOrFocus(app[2]) end)
end
```



解放你的鼠标吧.
