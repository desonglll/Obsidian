---
title: Math Expansion
date: 2022/09/01/ 10:48:38
tags: 笔记
updated: 2022/09/12/ 10:48:38
type: 考研
comments:
description:
keywords:
top_img:
mathjax: true
katex:
aside:
aplayer:
highlight_shrink:
sticky: 1
cover: https://pic.imgdb.cn/item/631e9c2d16f2c2beb1f2a323.jpg
---

- [常见的泰勒公式](#常见的泰勒公式)
- [常用的等价无穷小](#常用的等价无穷小)
- [特殊公式](#特殊公式)
  好的，以下是常用函数的泰勒展开式表：

1. 指数函数 $e^x$ 的泰勒展开式： $$e^x = \sum_{n=0}^\infty \frac{x^n}{n!}$$
2. 正弦函数 $\sin x$ 的泰勒展开式： $$\sin x = \sum_{n=0}^\infty \frac{(-1)^n}{(2n+1)!}x^{2n+1}$$
3. 余弦函数 $\cos x$ 的泰勒展开式： $$\cos x = \sum_{n=0}^\infty \frac{(-1)^n}{(2n)!}x^{2n}$$
4. 自然对数函数 $\ln(1+x)$ 的泰勒展开式： $$\ln(1+x) = \sum_{n=1}^\infty \frac{(-1)^{n-1}}{n}x^n, \qquad -1<x\leq 1$$
5. 正切函数 $\tan x$ 的泰勒展开式： $$\tan x = \sum_{n=1}^\infty \frac{(-1)^{n-1}2^{2n}(2^{2n}-1)B_{2n}}{(2n)!}x^{2n-1}, \qquad -\frac{\pi}{2}<x<\frac{\pi}{2}$$

其中 $B_n$ 表示伯努利数。

## 常见的泰勒公式

$$
sin(x)=x-\frac{1}{3!}x^3+O(x^3)
$$

$$
\arcsin(x)=x+\frac{1}{3!}x^3+O(x^3)
$$

$$
\cos(x)=1-\frac{x^2}{2!}+\frac{x^4}{4!}+O(x^4)
$$

$$
\arccos(x)=1+\frac{x^2}{2!}-\frac{x^4}{4!}+O(x^4)
$$

$$
\tan(x)=x+\frac{x^3}{3}+O(x^3)
$$

$$
\arctan(x)=x-\frac{x^3}{3}+O(x^3)
$$

$$
\ln(1+x)=x-\frac{x^2}{2}+\frac{x^3}{3}+O(x^3)
$$

$$
e^x=1+x+\frac{x^2}{2!}+\frac{x^3}{3!}+O(x^3)
$$

$$
(1+x)^\alpha=1+\alpha x+\frac{\alpha (\alpha -1)}{2!}x^2+O(x^2)
$$

## 常用的等价无穷小

$$
当x\to0时，常用的等价无穷小有：
$$

$$
\sin(x)\sim x
$$

$$
\tan(x) \sim x
$$

$$
\arcsin(x)\sim x
$$

$$
\arctan(x)\sim x
$$

$$
\ln(1+x)\sim x
$$

$$
e^x-1\sim x
$$

$$
a^x-1\sim x\ln a
$$

$$
1-\cos(x)\sim \frac{1}{2}x^2
$$

$$
(1+x)^\alpha-1\sim \alpha x
$$

## 特殊公式

$$
\arcsin x + \arccos x=\frac{\pi}{2},(-1\le x\le1)
$$

$$
\arctan x + \operatorname{arccot} x=\frac{\pi}{2},(-\infty \le x\le +\infty)
$$

Sure! Here are the LaTeX codes for the Taylor expansions of some common trigonometric and inverse trigonometric functions:

1. $\sin(x) = \displaystyle\sum_{n=0}^\infty \frac{(-1)^n}{(2n+1)!}x^{2n+1}$
2. $\cos(x) = \displaystyle\sum_{n=0}^\infty \frac{(-1)^n}{(2n)!}x^{2n}$
3. $\tan(x) = \displaystyle\sum_{n=1}^\infty \frac{B_{2n}(-4)^n(1-4^n)x^{2n-1}}{(2n)!}$, where $B_n$ is the $n$th Bernoulli number.
4. $\arcsin(x) = \displaystyle\sum_{n=0}^\infty \frac{(2n)!}{4^n(n!)^2(2n+1)}x^{2n+1}$, for $-1 \leq x \leq 1$
5. $\arccos(x) = \frac{\pi}{2} - \arcsin(x)$
6. $\arctan(x) = \displaystyle\sum_{n=0}^\infty \frac{(-1)^n}{2n+1}x^{2n+1}$, for $-1 < x \leq 1$

Note that the Taylor expansion for $\tan(x)$ involves the Bernoulli numbers, which can be defined recursively by $B_0 = 1$, $B_1 = -\frac{1}{2}$, and the formula $B_n = \sum_{k=0}^{n-1}\binom{n}{k}\frac{B_k}{n-k+1}$ for $n \geq 2$.

Sure! Here's the LaTeX code for the result of the integral of $\frac{1}{\sqrt{1+x^4}}$:

$\int \frac{1}{\sqrt{1+x^4}} \mathrm{d}x = \frac{1}{2}\sqrt{\frac{\sqrt{2}+1}{2}}\ln\left(\frac{\sqrt{2}+1}{\sqrt{2}-1}\cdot\frac{\sqrt[4]{x^2-\sqrt{2}x+1}}{\sqrt[4]{x^2+\sqrt{2}x+1}}\right)+C$

where $C$ is the constant of integration.
