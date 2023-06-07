---
title: ubuntu
date: 2023-06-07 14:31
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #操作系统
- #lin xu

## 查看 ubuntu 版本

```
lsb_release -a
```

## apt install Neovim

参考

https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu

激进的我选择了安装最新的 unstable 版本

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

保守的做法可以使用官方的 stable:

```
sudo add-apt-repository ppa:neovim-ppa/stable
```

## LunarVim

```sh
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

## FishShell

```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
```
