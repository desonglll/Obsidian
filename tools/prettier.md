---
title: prettier
date: 2023-06-07 14:07
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #npm
- #yarn
- #代码格式化

要使用 Prettier 格式化文件夹下的所有 Markdown 文件，您可以使用以下步骤：

1. 确保您已经安装了 Node.js 和 npm（Node.js 包管理器）。您可以在终端中运行以下命令来检查它们是否已安装：

```
node --version
npm --version
```

如果输出显示版本号，则表示它们已安装。

2. 在终端中，使用以下命令全局安装 Prettier：

```
npm install -g prettier
```

这将在您的系统上全局安装 Prettier 工具。

3. 进入包含 Markdown 文件的目录。例如，如果 Markdown 文件在名为"docs"的文件夹中，可以使用以下命令进入该目录：

```
cd path/to/docs
```

4. 运行以下命令以使用 Prettier 格式化 Markdown 文件：

```
prettier --write "**/*.md"
```

这将递归地在当前目录及其子目录中查找所有的`.md`文件，并使用 Prettier 对它们进行格式化。`--write`选项表示直接在文件中进行修改。

请注意，运行此命令将会更改 Markdown 文件的内容。建议在运行命令之前先进行备份，以防止意外修改。

您还可以根据需要调整 Prettier 的格式化选项和配置文件，以满足您的项目要求。
