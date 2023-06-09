---
title: 加快macOS的光标移动速度
date: 2023-06-07 14:20
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #macOS 工具
- #macOS 配置

我们常听到「键盘党」、「高效输入」这些词，但不知道你是否有注意过这么一个使用细节：按住键盘上的方向键不放，在光标开始移动之前，会有一个反应时间，然后光标才开始匀速移动。

这里的反应时间和移动速度其实都是可以调节的，在系统偏好设置 -> 键盘 -> 键盘（第一个标签页）里，有两个选项：

- **按键重复：**对应的是移动速度；

- **重复前延迟：**对应的是移动前的反应时间。

![](https://cdn.sspai.com/2017/03/20/8c63ccfb403f34c52e01ba490305066e.jpeg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

把它们都调到最快，你会感受到光标在屏幕上跳跃的快感。

如果你还是觉得不够快，可以尝试在「终端」应用输入以下代码：

```
defaults write NSGlobalDomain KeyRepeat -int 1defaults write NSGlobalDomain InitialKeyRepeat -int 15
```

- 第一行的  `KeyRepeat`  对应的是「按键重复」，系统设置里调到最快对应的值是  `2`，你可以调成  `0`  或者  `1`（建议调为  `1`，`0`  可能会太快）；
- 第二行的  `InitialKeyRepeat`  对应的是「重复前延迟」，系统设置里调到最快对应的值是  `15`，你可以尝试调成  `10`  或者更小，不过我还是建议保持  `15`，因为反应时间太快会容易导致误操作（比如 Esc 键和 Command-Z 这样的快捷键）；
- 输入后按回车，需要重启电脑后生效。

---

你也许会注意到系统设置采用的措辞是「重复」，而不是我描述的「移动」，是因为这些选项也适用于字符输入，比如长按字母  `a`  会输出一堆「aaaaaaaaa」。但是重复输入字符这个功能在有些电脑上是被禁用的，你需要在「终端」应用输入以下代码来开启（需重启电脑）：

```
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```
