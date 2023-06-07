---
title: shell-commands
date: 2023-06-07 14:26
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #shell
- #commands 

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

### 解压.tar 文件

要在终端中解压.tar 文件，可以使用以下命令：

```shell
tar -xf 文件名.tar
```

其中，`文件名.tar`是你要解压的.tar 文件的名称。使用`-x`选项表示解压缩，`-f`选项后面跟着文件名指定要解压的文件。

如果要将解压的文件提取到特定的目录中，可以使用`-C`选项，后面跟着目标目录的路径。例如：

```shell
tar -xf 文件名.tar -C 目标目录路径
```

这将解压文件到指定的目录中。

请注意，上述命令是针对.tar 文件的解压缩。如果你的文件是其他格式（例如.tar.gz 或.tar.bz2），则可能需要使用不同的选项和命令。

### 解压 rar 文件

在 macOS 终端中解压 RAR 文件，您可以使用 "unrar" 命令行工具。请确保您已经安装了该工具，然后按照以下步骤进行操作：

1. 打开终端应用程序（位于“应用程序/实用工具/终端”）。
2. 使用 "cd" 命令导航到包含 RAR 文件的目录。例如，如果 RAR 文件位于桌面上的 "archives" 文件夹中，可以输入以下命令进行导航：

```
cd Desktop/archives
```

3. 使用以下命令来解压 RAR 文件：

```
unrar x your_file.rar
```

请将 "your_file.rar" 替换为您要解压的实际文件名。

4. 终端将解压 RAR 文件到当前目录中。

请注意，"unrar" 命令行工具可能需要额外安装。您可以通过使用包管理器（如 Homebrew）来安装它。如果您尚未安装 Homebrew，请根据其官方网站提供的说明进行安装。

希望这可以帮助您成功解压 RAR 文件！如有其他问题，请随时提问。

#### 解压 rar 到同名文件夹

要使用 `unrar` 命令将文件解压到同名文件夹中，您可以使用 `-o+` 参数。按照以下步骤操作：

1. 打开终端应用程序（位于 "应用程序/实用工具/终端"）。
2. 导航到包含 RAR 文件的目录。例如，如果 RAR 文件位于桌面上的 "archives" 文件夹中，可以输入以下命令进行导航：

```
cd Desktop/archives
```

3. 使用以下命令来解压 RAR 文件并将其放置在同名文件夹中：

```
unrar x -o+ your_file.rar
```

请将 "your_file.rar" 替换为您要解压的实际文件名。

4. 终端将解压 RAR 文件，并在当前目录中创建一个同名的文件夹，将解压的文件放入其中。

通过使用 `-o+` 参数，`unrar` 命令将强制创建一个与 RAR 文件同名的文件夹，并将解压的文件放入该文件夹中。

希望这对您有所帮助！如有其他问题，请随时提问。

### 解压 7z 文件

在 macOS 终端中解压 7z 文件，您可以使用 "7z" 命令行工具。请按照以下步骤进行操作：

1. 打开终端应用程序（位于"应用程序/实用工具/终端"）。
2. 使用 "cd" 命令导航到包含 7z 文件的目录。例如，如果 7z 文件位于桌面上的 "archives" 文件夹中，可以输入以下命令进行导航：

```
cd Desktop/archives
```

3. 使用以下命令来解压 7z 文件：

```
7z x your_file.7z
```

请将 "your_file.7z" 替换为您要解压的实际文件名。

4. 终端将解压 7z 文件到当前目录中。

请注意，"7z" 命令行工具可能需要额外安装。您可以通过使用包管理器（如 Homebrew）来安装它。如果您尚未安装 Homebrew，请根据其官方网站提供的说明进行安装。

希望这可以帮助您成功解压 7z 文件！如有其他问题，请随时提问。

### 解压 `.tar.gz` 文件

在 macOS 终端中解压 `.tar.gz` 文件，您可以使用以下命令：

```
tar -zxvf your_file.tar.gz
```

请将 "your_file.tar.gz" 替换为您要解压的实际文件名。

解释一下每个选项的含义：

- `-z`: 表示使用 gzip 解压缩。
- `-x`: 表示提取（解压）文件。
- `-v`: 表示显示详细的输出信息，以便您可以看到解压的过程。
- `-f`: 表示指定要操作的文件。

执行该命令后，终端将解压 `.tar.gz` 文件到当前目录中。

希望这对您有所帮助！如有其他问题，请随时提问。
