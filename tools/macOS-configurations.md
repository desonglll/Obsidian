---
title: macOS-configurations
date: 2023-06-07 14:21
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #macOS配置 


```shell
# git clone加速
    git clone https://github.com/...
==> git clone https://gitclone.com/github.com/...
```

## 用 alias 在.bash_profile 中创建别名

> 以 Python3 为例子

### 1. 使用 touch 创建.bash_profile 文件

```shell
touch ~/.bash_profile
```

### 2. 使用 alias 命令给 python3 起别名

找到 python3 安装的路径`usr/local/bin/python3`

添加以下命令到`.bash_profile`

```shell
alias python='/usr/local/bin/python3'
```

### 3. .bash_profile source

```shell
source ~/.bash_profile
```

## 修改.zshrc 文件

有的时候需要每次在启动 Terminal 之后手动 source `.bash_profile`文件，所以可以修改.zshrc 文件，让 Terminal 每次启动时都自动 source

> 打开.zshrc 文件并添加以下命令

```shell
vim ~/.zshrc
```

```shell
source ~/.bash_profile
```

## 配置环境变量 PATH

### macOS 12 要在.zprofile 文件设置

```bash
nvim ~/.zprofile
```

### 要配置的 bin 目录的地址

```shell
/Users/mikeshinoda/.config/nvim/sources/jdtls/jdt-language-server-latest/bin
```

### 添加以下代码

```shell
export PATH="$HOME/.config/nvim/sources/jdtls/jdt-language-server-latest/bin:$PATH"
```

### 使生效

```bash
source ~/.zprofile
```

## 安装 homebrew 2022.07.13

Homebrew 的官方网站 [https://brew.sh/](https://brew.sh/)

### 1. 设置 USTC 的镜像

```shell
HOMEBREW_CORE_GIT_REMOTE=https://mirrors.ustc.edu.cn/homebrew-core.git
```

### 2. 安装 homebrew

执行以下命令

```shell
/bin/bash -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/ineo6/homebrew-install/install.sh)"
```

### 3. 添加 Homebrew 到环境变量

```shell
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$whoiam/.zprofile
```

```shell
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### 有关报错

#### brew update 的错误

fatal: Could not resolve HEAD to a revision

```shell
rm -rf $(brew --repo homebrew/core)
brew tap homebrew/core
```

### 替换国内镜像源

https://blog.csdn.net/m0_50324291/article/details/108564732

```shell
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
```

### fatal: not in a git directory Error: Command failed with exit 128: git

[fatal: not in a git directory Error: Command failed with exit 128: git](https://blog.csdn.net/king14bhhb/article/details/126799622)

## npm 换源

```shell
//换源
npm config set registry https://registry.npm.taobao.org
//配置后通过以下方法验证是否成功
npm config get registry
```

## 安装 fishshell

Fishshell 的官方网站 [https://fishshell.com/](https://fishshell.com/)

### 使用 Homebrew 安装

```shell
brew install fish
```

### 讲 fishshell 设为默认 Terminal

打开`~/.bash_profile`并且添加`fish`

## 修改 host 文件提高 Github 访问速度

> Improve the speed of loading GitHub.

```shell
sed -i "/# GitHub520 Host Start/Q" /etc/hosts && curl

https://raw.hellogithub.com/hosts >> /etc/hosts
```

## 安装 Tree

> tree 命令可以以树形结构显示文件目录结构
> 它非常适合于我们给别人介绍我们的文件目录的组成框架
> 同时该命令使用适当的参数也可以将命令结果输出到文本文件中

### 在 macOS 里安装 Tree

#### 1. 写入"~/.bash_profile"

mac 下默认是没有 tree 命令的，我们将命令写到~/.bash_profile 里，以后直接运行 tree 命令就更方便了

Open "~/.bash_profile" file.

```shell
vim  ~/.bash_profile
```

Copy these codes to "~/.bash_profile" file.

```shell
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
```

#### 2. 通过 Homebrew 安装 Tree

```shell
brew install tree
```

## Tree 命令行参数

### 1. tree 命令行参数

- -a 显示所有文件和目录。
- -A 使用 ASNI 绘图字符显示树状图而非以 ASCII 字符组合。
- -C 在文件和目录清单加上色彩，便于区分各种类型。
- -d 显示目录名称而非内容。
- -D 列出文件或目录的更改时间。
- -f 在每个文件或目录之前，显示完整的相对路径名称。
- -F 在执行文件，目录，Socket，符号连接，管道名称名称，各自加上`*` `/` `=` `@` `|`号。
- -g 列出文件或目录的所属群组名称，没有对应的名称时，则显示群组识别码。
- -i 不以阶梯状列出文件或目录名称。
- -I 不显示符合范本样式的文件或目录名称。
- -l 如遇到性质为符号连接的目录，直接列出该连接所指向的原始目录。
- -n 不在文件和目录清单加上色彩。
- -N 直接列出文件和目录名称，包括控制字符。
- -p 列出权限标示。
- -P 只显示符合范本样式的文件或目录名称。
- -q 用`?`号取代控制字符，列出文件和目录名称。
- -s 列出文件或目录大小。
- -t 用文件和目录的更改时间排序。
- -u 列出文件或目录的拥有者名称，没有对应的名称时，则显示用户识别码。
- -x 将范围局限在现行的文件系统中，若指定目录下的某些子目录，其存放于另一个文件系统上，则将该子目录予以排除在寻找范围外。

当然你也可以直接通过`tree --help`查询

### 2. 常用的命令

#### 查看不同级别子目录和文件

使用`tree -L N`这个命令，只查看当前第 N 级的目录和文件
使用`tree -L 1`这个命令，只查看当前第一级的目录
使用`tree -L 2`这个命令，只查看当前第二级的目录和文件

#### 目录结构信息输入保存到 txt 文件中

```shell
tree > /home/index.text
```

会在指定目录下创建 index.txt 文件

## Tools

### Material UI

<https://mui.com>

## 在 macOS 使用 npm 安装 yarn

```shell
sudo npm install --global yarn
```

## 安装 live-server

### 1. 使用 npm 命令安装

```shell
sudo npm install -g live-server
```

## 安装 Android Studio

### 配置代理 Proxy

Select `Auto-detect proxy settings` and use this address:

`mirrors.opencas.org:80`

## yarn 更换源

```bash
//查看当前源
yarn config get registry
//设置淘宝源或内网源
yarn config set registry https://registry.npm.taobao.org --global
//恢复源
yarn config set registry https://registry.yarnpkg.com --global

```

## npm 更换源

```bash
查看当前源地址：
npm config get registry

切换源地址命令如下：

切换至淘宝源：
npm config set registry=http://registry.npm.taobao.org/

切换至npm源：
npm config set registry=http://registry.npmjs.org

临时使用：
npm --registry https://registry.npm.taobao.org install express
```

### “Navicat Premium.app”已损坏，无法打开。 您应该将它移到废纸篓

https://blog.csdn.net/bx_jobs/article/details/127986496

```
sudo xattr -r -d com.apple.quarantine
```

### 查看端口被哪个程序占用

- 1.查看端口被哪个程序占用

  - `sudo lsof -i tcp:port`

  - 如：`sudo lsof -i tcp:8082`

- 2.看到进程的 PID，可以将进程杀死。

  - `sudo kill -9 PID`
  - 如：`sudo kill -9 3210`
