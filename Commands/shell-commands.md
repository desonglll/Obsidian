---
title: shell commands
date: 2022/09/26/ 15:29:30
description: 
---

## copy file or directory

```shell
files=$(ls)
for i in $files;
do
        echo "${i}"
        cp -R "${i}" /Users/mikeshinoda/Documents/shell测试/2
done
# -R 旗标使 cp 拷贝该文件夹及其内容。请注意，文件夹名称不以斜杠结尾，因为斜杠会改变 cp 拷贝文件夹的方式。
```

## delete all files in current directory but keep directory

```shell
rm -f *
```

[OS Family tree](https://eylenburg.github.io/os_familytree.htm)

## Useful commands

`whoami` - display effective user id.

`clear` - clear the terminal screen.

`pwd` - output the current working directory

## 拷贝文件夹内所有文件及子文件夹

要拷贝文件夹内的所有文件及子文件夹，你可以使用以下命令：

```shell
cp -R 源文件夹路径 目标文件夹路径
```

其中，`源文件夹路径`是你要拷贝的文件夹的路径，`目标文件夹路径`是拷贝后的目标文件夹路径。

使用`-R`选项是为了递归地拷贝文件夹及其所有内容，包括子文件夹和文件。这将保持文件夹结构并将所有文件和子文件夹复制到目标文件夹中。

请确保目标文件夹是一个有效的目录路径，并且具有足够的权限来进行拷贝操作。

## 解压文件

要在终端中解压.tar文件，可以使用以下命令：

```shell
tar -xf 文件名.tar
```

其中，`文件名.tar`是你要解压的.tar文件的名称。使用`-x`选项表示解压缩，`-f`选项后面跟着文件名指定要解压的文件。

如果要将解压的文件提取到特定的目录中，可以使用`-C`选项，后面跟着目标目录的路径。例如：

```shell
tar -xf 文件名.tar -C 目标目录路径
```

这将解压文件到指定的目录中。

请注意，上述命令是针对.tar文件的解压缩。如果你的文件是其他格式（例如.tar.gz或.tar.bz2），则可能需要使用不同的选项和命令。
