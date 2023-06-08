---
title: Python-Study-Qianfeng
date: 2023-06-07 19:58
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #B 站学习
- #Python
- #编程语言

## P9 Python 基础实战 8-类型转换

```python
one = input('输入第一个数：)
two = input('输入第二个数：)
# 进行计算
print (one + two)
# 转换
print (int (one) + int (two)) # 150
print (float (one) + float (two)) # 150.0
# 差
print (int(one) int(two)) # 50
print (float (one) float (two)) # 50.0
```

以变量名：a

str---> int int(a) 但是如果'9.9'而且是字符串类型转成 int 的时候报错了

str---> float float (a)

int--->str str(a)

float----> str str(a)

int---> float float(a)

float---> int int(a) 只不过 float 类型中小数点后面的数字被抹掉了

```python
flag = True
# bool----> int
print (int(flag))
print (float (flag))
print (str(flag))   # 'True'
```

能否将 a 转成 bool

```python
a = 2
print (bool(a))
a = 0
print(bool(a))
a = ''
print(bool(a))

# 变量的值是：0, '',转换结果是false
```

## P10 Python 基础实战 9-算术运算符

```python
a = 1
b = 2

c = a + b

# print (a, b, 1000, 10000, sep='#')
# print (a, b, c, end='\n') # 1 2 3   表示末尾换行
print(a, b, c)
```

`/`表示除法

`//`表示整除

`*`表示乘法

`**`表示幂

`%`表示取模（取余）

## P11 Python 基础实战 10-赋值运算符

```python
a = 8
b = 4

c = a + 1

a += 1   # a = a + 1
b -= 2   # b = b - 2

d = 3
b //= d   # b = b // d
```

## P12 Python 基础实战 11-比较（关系）运算符

结果 True 或 False

`> < >= <= == != is`

```python
a = 10
b = 23

print (a > b) # False
print (a < b) # True

print (a == b) # False
print (a != b) # True
```
