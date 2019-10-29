---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: __strong和__weak
date: 2019-10-29 14:04
category: 开发
tags: [ios,objc]
---



[进一步谈谈 __strong 和 __weak](https://ziecho.com/post/ios/2015-09-02)

```objc
- (void)foo {
    __weak typeof(self) weakSelf = self; //解决循环引用
    self.block = ^{
        __strong typeof(weakSelf) strongSelf = weakSelf; // retain(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@",strongSelf);
          	//if (stringSelf) {
            //  
            //}
        });
      	// 结束后 strongSelf超出作用域, 会release(self)
    };
    self.block();
    [self.navigationController popViewControllerAnimated:YES];
}
```

`__strong`只能保证在block执行期间self不为nil,尽可能保证在执行期间持有self,只是尽可能,block中还是要检查self的有效性.

