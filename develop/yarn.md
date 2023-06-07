---
title: yarn
date: 2023-06-07 14:23
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #yarn 
- #环境配置


## 配置 yarn 的镜像源为中国国内

要将 Yarn 的镜像源配置为中国国内的镜像源，可以按照以下步骤进行操作：

1. 打开终端或命令提示符。
2. 运行以下命令以全局配置 Yarn 的镜像源为淘宝镜像：

```shell
yarn config set registry https://registry.npm.taobao.org/
```

3. 运行以下命令以验证配置是否生效：

```shell
yarn config get registry
```

上述命令将输出当前配置的镜像源。确保输出的镜像源为 `https://registry.npm.taobao.org/`。

这样配置后，Yarn 将使用淘宝镜像源作为默认源，加快依赖包的下载速度。

如果你之前已经配置了其他镜像源，可以使用以下命令重置为默认源：

```shell
yarn config delete registry
```

运行上述命令后，Yarn 将恢复使用官方默认的镜像源。

注意：在中国国内使用淘宝镜像源是一种常见的做法，但请确保你信任镜像源的提供者，以避免潜在的安全风险。
