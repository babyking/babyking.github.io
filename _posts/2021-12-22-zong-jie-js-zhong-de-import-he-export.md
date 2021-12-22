---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 总结js中的import和export
date: 2021-12-22 15:41
category: 技术
tags: [js,javascript,import,export]
---



1. `export {a,b,c}` 中的花括号不是对象,是导出的列表,与`export a` `export b` `export c`等同

2. `import  a from 'b'` , 其中a 有没有花括号,**取决于b中 export的时候是不是default, export default, 在import时不需要花括号**

3. 导出的这些名称,导入的时候是只读的,不能更改. 

4. `import * as x from 'b'`  这里的x就变成了一个对象, b导出的的就成为这个对象 的成员

5. `import a from   'b'` 这里b可以是`./b`或`'./b.js' ` 如果是b那需要配置文件设置查找路径

6. 本质上是对导出对象的绑定。js引擎会有一个模块环境记录(module enviroment record) ，对所有的东西进行bindings，如果导出的js修改了导出的值，那么导入方也会被修改。这里和Node中是不同的

7. export输出的是对外的接口,所以`var m = 1;export m` 是错误的.要写成`export {m}`,类和函数也一样. `export var m = 1`这是可以的. 

8. `import b`只执行b模块,但没有输入任何值

9. `export default function(){}` ,在import的时候可以指定变量 `import custom_var from b` . export default 其实就是输出了一个叫做default的变量.以下是等价的

   ```js
   /*a.js*/
   
   function foo(){}
   export default foo;
   //等价于
   function foo(){}
   export {foo as default}
   //等价于
   export default function () {}
   //等价于
   ```

   导入时,以下是等价的

   ```js
   import {default as FOO} from 'a.js'
   //等价于
   import FOO from 'a.js'
   ```

   因为`export default`命令其实只是输出一个叫做`default`的变量，所以它后面不能跟变量声明语句

   ```js
   // 正确
   export var a = 1;
   
   // 正确
   var a = 1;
   export default a;
   
   // 错误
   export default var a = 1;
   ```

   上面代码中，`export default a`的含义是将变量`a`的值赋给变量`default`。所以，最后一种写法会报错。

   同样地，因为`export default`命令的本质是将后面的值，赋给`default`变量，所以可以直接将一个值写在`export default`之后。

   ```js
   // 正确
   export default 42;
   
   // 报错
   export 42;
   ```

10. `import _ from 'b';` 导入export default `import _, { each, forEach } from 'b';` 导入缺省和其他export

11. ```js
    //导出导入
    export { foo, bar } from 'my_module';
    
    // 可以简单理解为
    import { foo, bar } from 'my_module';
    export { foo, bar };
    ```

    上面代码中，`export`和`import`语句可以结合在一起，写成一行。但需要注意的是，写成一行以后，`foo`和`bar`实际上并没有被导入当前模块，只是相当于对外转发了这两个接口，导致当前模块不能直接使用`foo`和`bar`

12. 具名接口改为默认接口的写法如下

    ```js
    export { es6 as default } from './someModule';
    
    // 等同于
    import { es6 } from './someModule';
    export default es6;
    ```
