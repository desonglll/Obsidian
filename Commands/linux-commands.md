---
title: linux-commands
date: 2023/04/06/ 11:49:04
discription:
tags:
updated:
type:
comments:
description:
keywords:
top_img:
mathjax: true
katex:
aside:
aplayer:
highlight_shrink:
sticky:
cover:
---

- [Linux 系统下如何保持进程在 SSH 客户端断开后仍继续运行？](#linux-系统下如何保持进程在-ssh-客户端断开后仍继续运行)
  - [使用场景](#使用场景)
  - [**方法一：使用 nohup 执行命令**](#方法一使用-nohup-执行命令)
  - [**方法二：使用 screen 执行命令**](#方法二使用-screen-执行命令)
- [Linux crontab 命令](#linux-crontab-命令)
  - [语法](#语法)
  - [实例](#实例)
  - [脚本无法执行问题](#脚本无法执行问题)

## Linux 系统下如何保持进程在 SSH 客户端断开后仍继续运行？

本文介绍在 Linux 系统的 ECS 实例内，当断开 SSH 客户端后，如何保持进程继续运行的解决方案。

### 使用场景

在 Linux 系统中，在执行一些运行时间比较长的任务时，必须等待执行完毕才能断开 SSH 连接或关闭客户端软件，否则可能会导致执行中断。本文介绍两种保障程序在您退出登录后持续运行的方法。

### **方法一：使用 nohup 执行命令**

nohup，可以使运行的命令忽略 SIGHUP 信号。因此，即使退出登录，程序仍旧会继续执行。通常情况下，在 nohup 命令尾部加上**&**字符，才能将命令放至后台执行。具体示例如下所示。

**说明**

nohup 通常用于执行无干预的自动化程序或脚本，无法完成带有交互的操作。

1. 执行如下命令，每秒输出一行信息。

   ```javascript
   bash hello.sh
   ```

   系统显示类似如下。

2. 使用 nohup 执行命令。

   在命令头尾分别加上 nohup 和&，可以看到 nohup 输出了一行信息，再 Enter 键就跳回了 Shell 命令行，此时命令已经在后台执行了，nohup 将命令的输出重定向至当前目录的 nohup.out 文件中。同时，nohup 会将对应程序的 PID 输出，PID 可用于需要中断进程时结束进程。

   **说明**

   在命令中也可以使用重定向将程序的输出改为自己想要的文件名，如下所示，则程序的输出就会写到 hello.log 文件中。

   ```javascript
   nohup bash hello.sh >hello.log &
   ```

   ```javascript
   nohup bash hello.sh &
   ```

   系统显示类似如下。

3. 执行如下命令，可以持续的查看 nohup.out 的输出，达到监控程序的效果。

   ```javascript
   tail -f nohup.out
   ```

4. 执行如下命令，结束进程。

   ```javascript
   kill - TRM[$PID];
   ```

   **说明**

   [$PID]为之前 nohup 命令输出的值。

### **方法二：使用 screen 执行命令**

GNU Screen 一款由 GNU 计划开发的用于命令行终端切换的软件，可以当做窗口管理器的命令行界面版本。只要 Screen 本身没有被终止，在其内部运行的会话都可以恢复，特别适合执行一些运行时间长的任务。

1. 安装 screen 工具。

   Linux 系统默认没有 screen 工具，需要先进行安装。

   - CentOS 系列系统安装命令如下所示。

     **说明**

     CentOS 6 与 CentOS 8 操作系统版本结束了生命周期（EOL），按照社区规则，CentOS 6/8 的源地址内容已移除。当您在 CentOS 6/8 系统内继续使用默认配置的源地址时会发生报错。建议您先切换 CentOS 6/8 的源地址，然后再进行操作。具体操作，请参见[CentOS 6 EOL 如何切换源？](https://help.aliyun.com/document_detail/193569.htm)和[CentOS 8 EOL 如何切换源？](https://help.aliyun.com/document_detail/405635.htm)

     ```javascript
     yum install screen
     ```

   - Ubuntu 系列系统安装

     ```javascript
     sudo  apt-get  install screen
     ```

2. 执行如下命令，创建 screen 窗口。

   ```javascript
   screen - S[$Name];
   ```

3. 执行如下命令，列出 screen 窗口。

   ```javascript
   screen - ls;
   ```

   系统显示类似如下。

   ![img](/Users/mikeshinoda/Desktop/notes/Tools/assets/p519375.png)

4. 当需要运行脚本、执行程序时，在命令前添加 screen 即可。

5. 同时按**Ctrl**+**a**+**d**键，就可以退出 SSH 登录，但不会影响 screen 程序的运行。

6. 需要继续工作时，登录实例，然后执行如下命令，恢复会话即可。

   ```javascript
   screen - r - d;
   ```

## Linux crontab 命令

<https://www.runoob.com/linux/linux-comm-crontab.html>

<https://tooltt.com/crontab/c/29.html>

Linux **crontab** 是用来定期执行程序的命令。

当安装完成操作系统之后，默认便会启动此任务调度命令。

**crond** 命令每分钟会定期检查是否有要执行的工作，如果有要执行的工作便会自动执行该工作。

**注意：**新创建的 cron 任务，不会马上执行，至少要过 2 分钟后才可以，当然你可以重启 cron 来马上执行。

而 linux 任务调度的工作主要分为以下两类：

- 1、系统执行的工作：系统周期性所要执行的工作，如备份系统数据、清理缓存
- 2、个人执行的工作：某个用户定期要做的工作，例如每隔 10 分钟检查邮件服务器是否有新信，这些工作可由每个用户自行设置

### 语法

```
crontab [ -u user ] file
```

或

```
crontab [ -u user ] { -l | -r | -e }
```

**说明：**

crontab 是用来让使用者在固定时间或固定间隔执行程序之用，换句话说，也就是类似使用者的时程表。

-u user 是指设定指定 user 的时程表，这个前提是你必须要有其权限(比如说是 root)才能够指定他人的时程表。如果不使用 -u user 的话，就是表示设定自己的时程表。

**参数说明**：

- -e : 执行文字编辑器来设定时程表，内定的文字编辑器是 VI，如果你想用别的文字编辑器，则请先设定 VISUAL 环境变数来指定使用那个文字编辑器(比如说 setenv VISUAL joe)
- -r : 删除目前的时程表
- -l : 列出目前的时程表

时间格式如下：

```
f1 f2 f3 f4 f5 program
```

- 其中 f1 是表示分钟，f2 表示小时，f3 表示一个月份中的第几日，f4 表示月份，f5 表示一个星期中的第几天。program 表示要执行的程序。
- 当 f1 为 _时表示每分钟都要执行 program，f2 为_ 时表示每小时都要执行程序，其馀类推
- 当 f1 为 a-b 时表示从第 a 分钟到第 b 分钟这段时间内要执行，f2 为 a-b 时表示从第 a 到第 b 小时都要执行，其馀类推
- 当 f1 为 _/n 时表示每 n 分钟个时间间隔执行一次，f2 为_/n 表示每 n 小时个时间间隔执行一次，其馀类推
- 当 f1 为 a, b, c,... 时表示第 a, b, c,... 分钟要执行，f2 为 a, b, c,... 时表示第 a, b, c...个小时要执行，其馀类推

```
*    *    *    *    *
-    -    -    -    -
|    |    |    |    |
|    |    |    |    +----- 星期中星期几 (0 - 6) (星期天 为0)
|    |    |    +---------- 月份 (1 - 12)
|    |    +--------------- 一个月中的第几天 (1 - 31)
|    +-------------------- 小时 (0 - 23)
+------------------------- 分钟 (0 - 59)
```

使用者也可以将所有的设定先存放在文件中，用 crontab file 的方式来设定执行时间。

| 执行时间                 | 格式        |
| :----------------------- | :---------- |
| 每分钟定时执行一次       | \*_\*\* _   |
| 每小时定时执行一次       | 0 \*\*\*\*  |
| 每天定时执行一次         | 0 0 \*\* \* |
| 每周定时执行一次         | 0 0 \*\* 0  |
| 每月定时执行一次         | 0 0 1 \*\*  |
| 每月最后一天定时执行一次 | 0 0 L \*\*  |
| 每年定时执行一次         | 0 0 1 1 \*  |

### 实例

每一分钟执行一次 /bin/ls：

```
* * * * * /bin/ls
```

在 12 月内, 每天的早上 6 点到 12 点，每隔 3 个小时 0 分钟执行一次 /usr/bin/backup：

```
0 6-12/3 * 12 * /usr/bin/backup
```

周一到周五每天下午 5:00 寄一封信给 alex@domain.name：

```
0 17 * * 1-5 mail -s "hi" alex@domain.name < /tmp/maildata
```

每月每天的午夜 0 点 20 分, 2 点 20 分, 4 点 20 分....执行 echo "haha"：

```
20 0-23/2 * * * echo "haha"
```

下面再看看几个具体的例子：

```
0 */2 * * * /sbin/service httpd restart  意思是每两个小时重启一次apache

50 7 * * * /sbin/service sshd start  意思是每天7：50开启ssh服务

50 22 * * * /sbin/service sshd stop  意思是每天22：50关闭ssh服务

0 0 1,15 * * fsck /home  每月1号和15号检查/home 磁盘

1 * * * * /home/bruce/backup  每小时的第一分执行 /home/bruce/backup这个文件

00 03 * * 1-5 find /home "*.xxx" -mtime +4 -exec rm {} \;  每周一至周五3点钟，在目录/home中，查找文件名为*.xxx的文件，并删除4天前的文件。

30 6 */10 * * ls  意思是每月的1、11、21、31日是的6：30执行一次ls命令
```

**注意：**当程序在你所指定的时间执行后，系统会发一封邮件给当前的用户，显示该程序执行的内容，若是你不希望收到这样的邮件，请在每一行空一格之后加上 **> /dev/null 2>&1** 即可，如：

```
20 03 * * * . /etc/profile;/bin/sh /var/www/runoob/test.sh > /dev/null 2>&1
```

### 脚本无法执行问题

如果我们使用 crontab 来定时执行脚本，无法执行，但是如果直接通过命令（如：./test.sh)又可以正常执行，这主要是因为无法读取环境变量的原因。

**解决方法：**

- 1、所有命令需要写成绝对路径形式，如: **/usr/local/bin/docker**。

- 2、在 shell 脚本开头使用以下代码：

  ```bash
  #!/bin/sh

  . /etc/profile
  . ~/.bash_profile
  ```

- 3、在 **/etc/crontab** 中添加环境变量，在可执行命令之前添加命令 **. /etc/profile;/bin/sh**，使得环境变量生效，例如：

  ```bash
  20 03 * * * . /etc/profile;/bin/sh /var/www/runoob/test.sh
  ```
