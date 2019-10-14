---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: karabiner的alone,held_down,delayed_action这几个事件
date: 2019-07-18 16:20
category: 软件
tags: [karabiner,键盘]
---



在折腾karabiner的时候, `to_if_alone` `to_if_held_down` `to_delayed_action` 这几个事件之间的关系很不容易理解,特别是这几个需要配合的时候.

尝试做个试验理解一下.

```json
{
  "description": "test",
  "manipulators": [
    {
      "parameters": {
        "basic.to_delayed_action_delay_milliseconds": 300,
        "basic.to_if_alone_timeout_milliseconds": 200,
        "basic.to_if_held_down_threshold_milliseconds": 200
      },
      "from": {
        "key_code": "t",
        "modifiers": {
          "optional": [
            "any"
          ]
        }
      },
      "to_delayed_action": {
        "to_if_canceled": [
          {
            "key_code": "c"
          }
        ],
        "to_if_invoked": [
          {
            "key_code": "i"
          }
        ]
      },
      "to_if_alone": [
        {
          "halt": true,
          "key_code": "a"
        }
      ],
      "to_if_held_down": [
        {
          "key_code": "h",
          "repeat": false
        }
      ],
      "type": "basic"
    }
  ]
}
```

上面的配置参数经过多次实验,终于明白这几个事件的机制了.

首先了解这3个参数的功能:



"parameters": {

  			"basic.to_delayed_action_delay_milliseconds": 300,   

​        	   **// 按下一个键超过300毫秒触发 to_delayed_action事件,如果在300毫秒之内,有另外一个键的事件发性,则会触发其下的 to_if_canceled 事件,同时后面不会处理与to_if_canceled同级的to_if_invoked事件.**



  			"basic.to_if_alone_timeout_milliseconds": 200,    

  			**// 按下一个键并释放的时间不超过200毫秒触发 to_if_alone 事件**

  			

  			"basic.to_if_held_down_threshold_milliseconds": 200    

  			**//按下一个键超过200毫秒**         



}




这几个事件独立使用很简单,但是经过组合可以实现很酷的键盘定义.



比如,需要对T键做如下功能实现:

1. 正常的单击输出t
2. 长按F输出⌘

我们不加思索,就可以写个配置

```json
{
  "description": "test",
  "manipulators": [
    {
      "from": {
        "key_code": "t",
        "modifiers": {
          "optional": [
            "any"
          ]
        }
      },
      "to": [
        {
          "key_code": "t"
        }
      ],      
      "to_if_held_down": [
        {
          "key_code": "left_command",
          "repeat": false
        }
      ],
      "type": "basic"
    }
  ]
}
```



但是上面的配置可以运行,但是会有2个问题

1. 当单击t时,key_down与key_up事件间的时间处于`basic.to_if_alone_timeout_milliseconds`定义的临界点时,会顺序输出left_command和t,当然对于这个场景独立的输出command没有功能影响,但如果是其他功能组合键就会有问题了.

2. 当打字速度快的时候,当`t`的key_up事件还没发生的时候,另外一个键的key_down发生时,t的这个输入就会丢失.

![Snip20190718_2](/image/Snip20190718_2.png)



所以karabiner给出了 to_delayed_action > to_if_canceld 这样的事件有于补偿修正事件处于临界点的异常情况.



```json
{
  "description": "test",
  "manipulators": [
    {
      "parameters": {
        "basic.to_delayed_action_delay_milliseconds": 300,
        "basic.to_if_alone_timeout_milliseconds": 200,
        "basic.to_if_held_down_threshold_milliseconds": 200
      },
      "from": {
        "key_code": "t",
        "modifiers": {
          "optional": [
            "any"
          ]
        }
      },
      "to_delayed_action": { //超过300毫秒触发此事件块中所定义的事件
        "to_if_canceled": [  //在300毫秒内如果有其他键的事件发生,则触发此事件,此事件中的key_code定义为原始key,作为补偿修正,同时 to_if_invoked的事件不会再触发
          {
            "key_code": "t"
          }
        ]
        //,"to_if_invoked":[  //如果to_if_canceled 未被触发,超出300毫秒后刚触发此事件.
        //  {}
        //]
      },
      "to_if_alone": [
        {
          "halt": true,
          "key_code": "t"
        }
      ],
      "to_if_held_down": [
        {
          "key_code": "left_command",
          "repeat": false
        }
      ],
      "type": "basic"
    }
  ]
}
```



完美!

```json
"parameters": {
        "basic.to_delayed_action_delay_milliseconds": 300,
        "basic.to_if_alone_timeout_milliseconds": 200,
        "basic.to_if_held_down_threshold_milliseconds": 200
      }
```

反复测试后,以上几个参数设置为上面的值在我的机器表现最佳, 一般alone和held_down的时间设置为相同,delay_action要设置的比其他两个稍大一些.