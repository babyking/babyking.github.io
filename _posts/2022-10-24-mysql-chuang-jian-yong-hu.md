---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: MySQL 创建用户并授权
date: 2022-10-24 17:10
category: 技术
tags: [mysql]
---



转载: <https://cloud.tencent.com/developer/article/1859194>



**创建用户**

```javascript
CREATE USER 'usernamexxx'@'hostxxx' IDENTIFIED BY 'passwordxxx';
```

复制

说明：

- hostxxx：指定该用户在哪个主机上可以登陆，如果是本地用户可用 localhost，如果想让该用户可以从任意远程主机登陆，可以使用通配符 %
- passwordxxx：该用户的登陆密码，密码可以为空，如果为空则该用户可以不需要密码登陆[服务器](https://cloud.tencent.com/product/cvm?from=10680)

示例：

```javascript
CREATE USER 'jack'@'localhost' IDENTIFIED BY '123456';
CREATE USER 'rose'@'192.168.38.110_' IDENDIFIED BY '123456';
CREATE USER 'rose'@'%' IDENTIFIED BY '123456';
CREATE USER 'rose'@'%' IDENTIFIED BY '';
CREATE USER 'rose'@'%';
```

复制

注意：

创建用户后，该用户只能连接到[数据库服务](https://cloud.tencent.com/product/dbexpert?from=10680)器，但并没有操作该数据库服务器的权限。

## 授权

```javascript
GRANT privilegesxxx ON databasenamexxx.tablenamexxx TO 'usernamexxx'@'hostxxx'
```

复制

说明：

-  privilegesxxx：用户的操作权限，如 SELECT，INSERT，UPDATE 等，如果要授予所的权限则使用 ALL 
-  databasenamexxx：数据库名 
-  tablenamexxx：表名，如果要授予该用户对所有数据库和表的相应操作权限则可用 * 表示，如 *.* 

示例：

```javascript
GRANT SELECT, INSERT ON DbXXX.user TO 'jack'@'%';
GRANT ALL ON *.* TO 'jack'@'%';
GRANT ALL ON DbXXX.* TO 'jack'@'%';
```

复制

注意：

1.   授权之后需要用户重连 [MySQL](https://cloud.tencent.com/product/cdb?from=10680)，才能获取相应的权限。 
2.  用以上命令授权的用户不能给其它用户授权，如果想让该用户可以授权，用以下命令: 

```javascript
GRANT privilegesxxx ON databasenamexxx.tablenamexxx TO 'usernamexxx'@'hostxxx' WITH GRANT OPTION;
```

复制

## 设置与更改用户密码

```javascript
SET PASSWORD FOR 'usernamexxx'@'hostxxx' = PASSWORD('newpasswordxxx');
```

复制

如果是当前登陆用户用:

```javascript
SET PASSWORD = PASSWORD("newpasswordxxx");
```

复制

示例：

```javascript
SET PASSWORD FOR 'jack'@'%' = PASSWORD("123456");
```

复制

## 撤销用户权限

```javascript
REVOKE privilegexxx ON databasenamexxx.tablenamexxx FROM 'usernamexxx'@'hostxxx';
```

复制

示例：

```javascript
REVOKE SELECT ON *.* FROM 'jack'@'%';
```

复制

注意：

假如你在给用户'jack'@'%'授权的时候是这样的（或类似的）：GRANT SELECT ON test.user TO 'jack'@'%'，则在使用 REVOKE SELECT ON *.* FROM 'jack'@'%'; 命令并不能撤销该用户对 test 数据库中 user 表的 SELECT 操作。相反，如果授权使用的是 GRANT SELECT ON *.* TO 'jack'@'%'; 则 REVOKE SELECT ON test.user FROM 'jack'@'%'; 命令也不能撤销该用户对 test 数据库中 user 表的 Select 权限。 具体信息可以用命令 SHOW GRANTS FOR 'jack'@'%'; 查看。

## 删除用户

```javascript
DROP USER 'usernamexxx'@'hostxxx';
```

复制
