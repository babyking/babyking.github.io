---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: HammerSpoon下窗口在多个显示器切换
date: 2022-05-17 15:28
category: 技术
tags: [Mac,macOS]
---



![image-20220517195515187](/image/image-20220517195515187.png)



```lua
-- 多显示屏幕切换
hs.hotkey.bind(hyper, 'return', function() 
    local screens = #hs.screen.allScreens()
    hs.alert.show(screens)

    local w = hs.window.focusedWindow()

    if not w then 
        return
    end

    local east = w:screen():toEast()
    local west = w:screen():toWest()
    local north = w:screen():toNorth()
    local south = w:screen():toSouth()


    -- 两屏幕,左右或是上下位置排列
    if screens == 2 then
      -- local s  = w:screen():toWest()
      -- local s2 = w:screen():toEast()
      if east then
        w:moveToScreen(east)
      elseif west then
        w:moveToScreen(west)
      elseif north then
        w:moveToScreen(north)
      elseif south then
        w:moveToScreen(south)
      end

      return
    end


    --3屏幕的不同位置摆放具体操作并不相同,如何区别不同的位置摆放?? 不像两个屏幕一般只是左右和上下 ,~~3个屏幕有很多种摆放 ,只能定制几种自己不同的配置.然后通过机器ID或是不同机器特征来区别.待实现~~.  2022年6月06日已实现
    --
    if screens == 3 then
      -- 这里的s1如果不是nil代表当前所在的窗口在屏幕s1(因为其他两个s2 s3为nil),但s1的值并不是s1屏幕,所以并不能把s1当前目标屏幕.
      local s1_home = west and north and south  
      local s2_home = east and south
      local s3_home = east and north

      --办公室3屏, 左中右, 左边ipad,中间 macbook,右边外置显示器(主屏)
      local s1_office = west 
      local s2_office = east and west
      local s3_office = east

      is_home = s1_home or s2_home or s3_home


      if is_home then

        if s1_home then
          w:moveToScreen(w:screen():toWest())
          return
        end

        if s2_home then
          w:moveToScreen(w:screen():toSouth())
          return
        end

        if s3_home then
          w:moveToScreen(w:screen():toEast())
          return
        end

      else
        if s1_office then
          w:moveToScreen(w:screen():toWest())
          return
        end

        if s2_office then
          w:moveToScreen(w:screen():toWest())
          return
        end

        if s3_office then
          w:moveToScreen(w:screen():toEast())
          -- w:moveToScreen(w:screen():toEast())
          return
        end

      end

    end  

  
    
end)
```

