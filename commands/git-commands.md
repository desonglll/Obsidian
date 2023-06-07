---
title: git-commands
date: 2023-06-07 14:25
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #git
- #commands

## Github 相关

### GIT 查看/修改用户名和邮箱地址

#### 用户名和邮箱地址的作用

用户名和邮箱地址是本地 git 客户端的一个变量，不随 git 库而改变。

每次 commit 都会用用户名和邮箱纪录。

github 的 contributions 统计就是按邮箱来统计的。

#### 查看用户名和邮箱地址

```bash
git config user.name
git config user.password
git config user.email
```

#### 配置用户名和邮箱地址

```bash
git config --global user.name "desonglll" && git config --global user.password "Lindesong7758?" && git config --global user.email "lindesong666@163.com"
```

### 配置 SSH

#### 一、生成 SSH Key

```bash
ssh-keygen -t rsa -C "lindesong666@163.com"
```

上述操作执行完毕后，在 `~/.ssh/` 目录会生成 `XXX-rsa` (私钥)和 `XXX-rsa.pub` (公钥)

#### 二、添加公钥到你的远程仓库（github）

##### 1 、查看你生成的公钥

```shell
cat ~/.ssh/id_rsa.pub
```

这里会把公钥显示出来，我们把这段内容复制出来。

##### 2、添加公钥到远程仓库

登陆你的 github 帐户 -> 点击你的头像，然后点击 `Settings` -> 左栏点击 `SSH and GPG keys` -> 点击 `New SSH key`

然后将复制的公钥内容，粘贴进 `Key` 文本域内。 `title` 域，自己随便起个名字，建议与电脑位置或作用相关的名字，以为你今后可能会新增或者删除 ssh，取个好理解的名字也知道他是个哪台电脑的。

点击 `Add SSH key`

##### 3、查看 ssh 文件是否配置成功

```shell
ssh -T git@github.com
```

`输出： Hi danygitgit! You've successfully authenticated, but GitHub does not provide shell access.`

恭喜你，你的设置已经成功了

#### 三、修改 git 的 remote url

如果之前添加的是 `HTTPS` 协议的 github 仓库地址，那么每次 push 或者 pull 仍然需要密码，所以，我们需要将其修改为 `ssh` 协议的，这样，就不需要这么麻烦了。

那么我们应该怎么办呢？

##### 1、查看当前的 remote url

首先进入本地仓库，右键 -> `Git Bash Here`

```shell
 git remote -v
```

```shell
输出： origin https://github.com/danygitgit/document-library.git (fetch)
输出： origin https://github.com/danygitgit/document-library.git (push)
```

如果是以上的结果那么说明此项目是使用 `https` 协议进行访问的（如果地址是 git 开头则表示是 `git` 协议）

##### 2、复制远程仓库的 ssh 链接

登陆你的远程仓库，在上面可以看到你的 ssh 协议相应的 url，类似：

`git@github.com:desonglll/codes.git`

复制此 ssh 链接。

##### 3、修改 git 的 remote url

方法：

修改命令

```shell
git remote origin set-url [url]
```

先删后加

```shell
git remote rm origin
```

```shell
git remote add origin [url]
```

### Github 提交命令

```shell
echo "README" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:desonglll/codes.git
git push -u origin main
# git push -u origin main -f
```

### 合并远程分支到本地

```shell
git merge origin
```

### 切换分支

```bash
git checkout -b xxx
git branch -M main
```

> git checkout xxx 是指切换到 xxx（用 local 区的 xxx 替换 disk 区文件），-b 意味着 branch，即创建新分支，这条指令合起来意思是创建并切换到 xxx

### 查看文件差异

```bash
# 创建暂缓区
git init
# 查看暂存区与disk区文件的差异
git diff
```

### 添加文件到暂缓区

```bash
# 将xxx文件添加到暂存区
git add xxx

# 将暂存区内容添加到local区的当前分支中
git commit -m "update"

# 将local区的LocalBranchName分支推送到RemoteHostName主机的同名分支
# （若加-f表示无视本地与远程分支的差异强行push）
git push <RemoteHostName> <LocalBranchName>

# 同上，不过改成从远程主机下载远程分支并与本地同名分支合并
git pull <RemoteHostName> <RemoteBranchName>
```

```bash
git rebase xxx
```

> 假设当前分支与 xxx 分支存在共同部分 common，该指令用 xxx 分支包括 common 在内的整体替换当前分支的 common 部分（原先 xxx 分支内容为 common->diversityA，当前分支内容为 common->diversityB，执行完该指令后当前分支内容为 common->diversityA->diversityB）

```bash
# 不加-D表示创建新local分支xxx，加-D表示强制删除local分支xxx
git branch -D xxx
```

### macOS 的.gitignore 文件

在`.gitignore`文件中针对 macOS，您可以添加以下规则来忽略常见的 macOS 生成的文件和文件夹：

```
# macOS system files
.DS_Store
.AppleDouble
.LSOverride

# Icon must end with two \r
Icon

# Thumbnails
._*

# Files that might appear on external disk
.Spotlight-V100
.Trashes

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk
```

这些规则会忽略 macOS 系统生成的一些文件和文件夹，如`.DS_Store`、`.AppleDouble`、`.LSOverride`等。根据您的需求，您可以根据需要进行调整或添加其他规则。

请注意，`.gitignore`文件只会影响 Git 版本控制系统，不会直接影响 macOS 系统本身的行为。`.gitignore`文件应该位于项目根目录下，并在提交代码之前进行相应的配置。

### Yarn 的.gitignore 文件

在一个 Yarn 项目的`.gitignore`文件中，您可以添加以下内容来忽略常见的 Yarn 和 Node.js 相关文件和文件夹：

```
# Yarn
node_modules/
yarn-error.log
yarn.lock

# Node.js
npm-debug.log*
logs/
*.log
pids/
*.pid
*.seed
*.pid.lock

# Dependency directories
/.pnp/
.pnp.js

# Build output
/dist/
/build/
/out/

# IDE files
.vscode/
.idea/
*.sublime-project
*.sublime-workspace

# Miscellaneous
/.sass-cache/
.env.local
.env.development.local
.env.test.local
.env.production.local

# OS generated files
.DS_Store
Thumbs.db
```

这些规则会忽略项目中的`node_modules`文件夹、`yarn-error.log`、`yarn.lock`文件以及其他一些临时和构建相关的文件和文件夹。根据您的项目需求，您可以根据需要进行调整或添加其他规则。

请注意，`.gitignore`文件是针对 Git 版本控制系统的，它告诉 Git 忽略哪些文件和文件夹，因此它不会影响您的项目本身的行为或运行。`.gitignore`文件应该位于项目根目录下，并在提交代码之前进行相应的配置。

### npm 的.gitignore

在一个 npm 项目中，可以使用以下规则来配置 `.gitignore` 文件以忽略常见的 npm 和 Node.js 生成的文件和文件夹：

```
# Logs
logs
*.log

# Dependency directories
node_modules/
jspm_packages/

# Build directories
dist/
build/
out/

# OS generated files
.DS_Store
Thumbs.db

# Environment variables
.env
.env.local
.env.*.local

# IDE and editor files
.vscode/
.idea/
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# Test generated files
coverage/

# Miscellaneous
*.tmp
*.bak
*.cache
*.tgz
*.zip
```

这些规则会忽略一些常见的 npm 和 Node.js 相关文件和文件夹，如日志文件、依赖目录（`node_modules/`、`jspm_packages/`）、构建目录（`dist/`、`build/`、`out/`）、IDE 和编辑器文件等。

根据您的项目需求，您可以根据需要进行调整或添加其他规则。请确保 `.gitignore` 文件位于项目根目录下，并在提交代码之前进行相应的配置。

### Deploy.sh

```shell
# Echo time information to Changelog file.
time=$(date "+%Y-%m-%d %H:%M:%S")
# echo -e "\nLast updated by **`whoami`** at: "${time} >> "README.md"

# github deploy

git init
git add .
git commit -m "$(date "+%Y-%m-%d %H:%M:%S")"
git branch -M main
# git remote add origin
git push -u origin main -f
```

## 显示 Git 仓库的所有更改历史

要显示 Git 仓库的所有更改历史，您可以使用`git log`命令。`git log`会按照提交的时间顺序列出所有的提交历史记录。

以下是使用`git log`命令的基本用法：

```bash
git log
```

这将显示完整的提交历史记录，包括每个提交的哈希值、作者、提交日期和提交消息。

`git log`还有一些有用的选项可以帮助您更详细地查看历史记录。例如，您可以使用`--oneline`选项以精简的单行格式显示每个提交：

```bash
git log --oneline
```

您还可以使用`--graph`选项以图形化的方式展示提交历史，并显示分支和合并的路径：

```bash
git log --graph
```

还有许多其他选项和参数可用于`git log`命令，以适应不同的需求。您可以使用`git log --help`查看完整的帮助文档，以了解更多详细信息和选项。

## 切换分支

要在 Git 中切换分支，可以使用`git checkout`命令。下面是一些常见的用法：

1. 切换到已存在的分支：

   ```bash
   git checkout branch_name
   ```

   其中`branch_name`是您要切换到的分支的名称。

2. 创建并切换到新的分支：

   ```bash
   git checkout -b new_branch_name
   ```

   这将创建一个新的分支`new_branch_name`并立即切换到该分支。

3. 切换到上一个分支：
   ```bash
   git checkout -
   ```
   这将切换回上一个所在的分支。

在切换分支之前，请确保您已提交或保存了当前分支的更改，因为切换分支时可能会丢失未提交的更改。

注意：在切换分支时，Git 会将工作目录和文件更新为目标分支的状态。因此，确保您已经完成了当前分支上的工作，或者至少保存了未提交的更改，以免丢失数据。

请注意，切换分支可能会导致未提交的更改和本地未跟踪的文件出现冲突。在切换分支之前，确保您了解当前分支的状态，并做好相应的处理，例如提交更改或保存文件。

## 显示所有的分支

要显示所有的分支，可以使用`git branch`命令。下面是几种常见的用法：

1. 显示所有本地分支：

   ```bash
   git branch
   ```

   这将列出本地仓库中的所有分支，并在当前分支前面用`*`标记。

2. 显示所有本地和远程分支：

   ```bash
   git branch -a
   ```

   这将列出本地仓库和远程仓库中的所有分支，包括远程分支的跟踪分支。

3. 显示分支及其最近的提交信息：
   ```bash
   git branch -v
   ```
   这将列出所有本地分支，并显示每个分支的最新提交的 SHA 值和提交消息。

通过使用这些`git branch`命令的不同选项，您可以获取有关仓库中存在的所有分支的详细信息。

## 创建一个新的分支

要在 Git 中创建一个新的分支，您可以使用`git branch`命令。下面是创建新分支的步骤：

1. 确保您当前位于希望创建新分支的代码状态下。

2. 运行以下命令来创建一个新的分支：

   ```bash
   git branch <branch-name>
   ```

   在`<branch-name>`中替换为您想要给新分支起的名称。

3. 您可以使用`git branch`命令检查新分支是否成功创建。在分支列表中，新分支将显示，但当前分支不会改变。

4. 要切换到新创建的分支，可以使用`git checkout`命令：
   ```bash
   git checkout <branch-name>
   ```
   这将切换到新分支，并将您的工作目录和代码状态切换到该分支下。

除了上述方法，还有一个简化的方法可以直接创建并切换到新分支：

```bash
git checkout -b <branch-name>
```

这将创建一个名为`<branch-name>`的新分支，并立即切换到该分支。

无论使用哪种方法，您都可以使用`git branch`命令来验证新分支的创建和切换。

## 在 Git 中删除分支

要在 Git 中删除分支，您可以使用`git branch`命令的`-d`或`-D`选项。下面是删除分支的步骤：

1. 首先，确保您不在要删除的分支上工作。您可以通过使用`git branch`命令查看当前分支以及其他分支的列表。

2. 运行以下命令来删除分支：

   - 对于已经合并到主分支或其他分支的分支，可以使用`-d`选项：
     ```bash
     git branch -d <branch-name>
     ```
     在`<branch-name>`中替换为要删除的分支的名称。
   - 对于尚未合并的分支，如果要强制删除分支，可以使用`-D`选项：
     ```bash
     git branch -D <branch-name>
     ```
     同样，在`<branch-name>`中替换为要删除的分支的名称。

3. 运行命令后，Git 会删除指定的分支。

请注意，删除分支是一个不可逆的操作，请确保您真正想要删除指定的分支。建议在删除分支之前，确认分支上的工作已经合并或保存。
