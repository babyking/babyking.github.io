---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 制作linux动态库
date: 2021-08-31 14:27
category: Linux
tags: [动态库]
---

一、将.c生成.o文件 

```
	gcc -c add.c -o add.o
	gcc -c -fPIC add.c -o add.o  (生成与位置无关的代码)
```

二、使用gcc -shared 制作动态库

```
gcc -shared lib库名.so  add.o (这里的add.o要使用-fPIC参数生成)
```

三、编译可执行程序,指定动态库, -l指定库名(去掉lib前缀和.so后缀) -L指定库路径

```
	gcc test.c -o a.out -lmymath -L./lib
```

四、执行./a.out 出错 

```
libmymath.so: cannot open shared object file: No such file or directory
```

​		原因:
​		动态 		工作于链接阶段, 需要 -l -L
​		动态链接器	工作于运行时, 工作时需要提供动态库所在的目录位置. 通过环境变量 

```
export LD_LIBRARY_PATH=./; ./a.out 
```

这时就运行正常了

上面的环境变量一般写入到 ~/.bashrc来永义生效
