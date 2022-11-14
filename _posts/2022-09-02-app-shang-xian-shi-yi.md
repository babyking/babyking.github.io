---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: iOS/macOS 开发上线拾遗
date: 2022-09-02 14:59
category: 技术
tags: [ios,app,appstore]
---



# Info.plist

1. `Supports Document Browser` `YES`   //如果APP接受分享文件需要增加此项
2. 





## 隐私政策和EULA

1. 在APP介绍说明中添加隐私政策和EULA的链接

2. 在APP中添加隐私政策和EULA的链接. EULA如果自己不定制,可以使用苹果官方的. 审核中会检测APP二进制中是否有Appstore后台中配置的链接内容.

   

## 国际化/多国语言

![image-20220907215136408](/image/image-20220907215136408.png)

## 未使用出口加密

![image-20220902150231380](/image/image-20220902150231380.png)

## 文件输出输出文件定义

![image-20220902150609634](/image/image-20220902150609634.png)

```xml
<key>UTExportedTypeDeclarations</key>
	<array>
		<dict>
			<key>UTTypeConformsTo</key>
			<array>
				<string>public.audiovisual-content</string>
			</array>
			<key>UTTypeDescription</key>
			<string>import</string>
			<key>UTTypeIconFiles</key>
			<array/>
			<key>UTTypeIdentifier</key>
			<string>io.github.babyking.Converter</string>
			<key>UTTypeTagSpecification</key>
			<dict/>
		</dict>
	</array>
	<key>UTImportedTypeDeclarations</key>
	<array>
		<dict>
			<key>UTTypeConformsTo</key>
			<array>
				<string>public.audiovisual-content</string>
			</array>
			<key>UTTypeDescription</key>
			<string>export</string>
			<key>UTTypeIconFiles</key>
			<array/>
			<key>UTTypeIdentifier</key>
			<string>io.github.babyking.Converter</string>
			<key>UTTypeTagSpecification</key>
			<dict/>
		</dict>
	</array>
```



## 不同版本复制Target的需要注意的地方 

一、bundle id 及图标

![image-20220902150759278](/image/image-20220902150759278.png)

二、Build Setting 中区分不同版本的编译flag

![image-20220902151859794](/image/image-20220902151859794.png)

三、Info文件

![image-20220902152034010](/image/image-20220902152034010.png)

四、Bridge头文件,如果不同版本有各自的头文件

![image-20220902152128573](/image/image-20220902152128573.png)

五、参与编译的文件

![image-20220902152250731](/image/image-20220902152250731.png)

六、 target名称,注意两个地方的名称xcode不会保持一至,要自己管理

![image-20220902152555350](/image/image-20220902152555350.png)



## 沙盒中运行可执行文件

1. 可执行文件的权限文件最好是独立的,内容如下不能多也不能少. `tool.entitlements`

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
   	<key>com.apple.security.app-sandbox</key>
   	<true/>
   	<key>com.apple.security.inherit</key>
   	<true/>
   </dict>
   </plist>
   ```

2. 可执行文件签名

   ```shell
   # tool.entitlements 是1中的文件, -s 后面的签名文件最好是用 Developer ID
   # 显示系统中的签名运行     security find-identity -v -p codesigning
   codesign -f --entitlements tool.entitlements -s  "Developer ID Application: bob kim (CLGQ79D2QA)" exefile
   ```

3. 对于可执行文件运行依赖动态库的(一般是在macOS下),需要更改可执行文件中的`@rpath`(run path). *重点: @rpath是存在于可执行文件中的,而不是动态库中的.相当于这个可执行文件的动态库搜索路径 ,有点类似于java中的CLASSPATH*

   >本质上它不是一个明确的path，甚至可以说它不是一个path。它只是一个变量，或者叫占位符。这个变量通过XCode中的run path选项设置值，或者通过install_name_tool的-add_rpath设置值。设置好run path之后，所有的@rpath都会被替换掉。此外，run path是可以设置多个值的，这样看来就和Windows下的PATH变量差不多了

   对于mac程序来说,一般会把可执行文件放在Resource或是程序Bundle下的一个目录中,这个时候一般会用`@executable_path`来替换 `@rpath`.

   ```sh
   install_name_tool -change @rpath/libtensorflow.2.dylib @executable_path/../Frameworks/xxx.dylib exefile
   ```

   **如果有第3步要在第2步可执行文件签名之前执行,执行后再签名**

4. 签名完后的可执行文件是不可以在终端下执行的,因为权限已经将其限制为沙盒程序来启动他,并且各种权限也是继承于主程序的.所以可执行程序的单独测试最好再用单独的一份未做以上签名文件来进行.

## macOS应用程序要在Info.plist加入分类

info.plist加入 APP Category.  比如:工具类, mac要在info.plist里加.iOS不用,否则审核会提示如下信息

```
1. App Store Connect Operation Error
The product archive is invalid. The Info.plist must contain a LSApplicationCategoryType key, whose value is the UTI for a valid category. For more details, see "Submitting your Mac apps to the App Store".
```

