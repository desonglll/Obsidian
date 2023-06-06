---
title: String
date: 2023/05/30/ 19:19:04
discription:
tags:
updated:
type:
comments:
description:
keywords:
top_img:
mathjax: true
katex:
aside:
aplayer:
highlight_shrink:
sticky:
cover:
---

## 串

### 串的定义

```c
#define MaxSize 255

typedef struct {
  char ch[MaxSize];
  int length;
} SString;
```

### 串的初始化

```c
SString *initSString(SString *sstring) {
  sstring = (SString *)malloc(sizeof(SString));
  sstring->length = 0;
  // sstring->ch[sstring->length] = '\0';
  return sstring;
}
```

### 串的打印

```c
void display(SString *s) {
  for (int i = 1; i <= s->length; i++) {
    printf("%c", s->ch[i]);
  }
  printf("\n");
}
```

### 串的赋值

```c
void strAssign(SString *s, const char chars[]) {
  s->length = 0;
  for (int i = 0; chars[i] != '\0'; i++) {
    s->ch[i + 1] = chars[i];
    s->length++;
  }
}
```

### 串的比较

```c
// 复杂版
int strCompare(SString *s1, SString *s2) {
  for (int i = 1; i <= s1->length; i++) {
    if (s1->ch[i] > s2->ch[i])
      return 1;
    else if (s1->ch[i] < s2->ch[i]) {
      return -1;
    }
  }
  if (s1->length == s2->length)
    return 0;
  else if (s1->length > s2->length)
    return 1;
  else
    return -1;
}
```

### 简单的模式匹配算法

```c
// 简单的模式匹配算法
int Index(SString *s, SString *t) {
  int i = 1, j = 1;
  // 当i越过主串的长度或者j越过模式串的长度时结束循环
  while (i <= s->length && j <= t->length) {
    if (s->ch[i] == t->ch[j]) { // 如果相同则进行下一个比较
      i++;
      j++;
    } else {         // 比较失败
      i = i - j + 2; // i返回到下一个字串的第一个位置
      j = 1;         // j返回到模式串的第一个位置
    }
  }
  // 如果是j越过模式串的长度导致循环结束
  if (j > t->length) // 如果匹配成功，此时j的值为模式串长加1
    return i - t->length; // 返回匹配成功的子串的首字符位序
  // 如果是i越过主串的长度导致循环结束
  else
    return -1;
}
```

### KMP 算法

```c
#define MaxSize 255

typedef struct {
  char ch[MaxSize];
  int length;
} SString;

int Index_KMP(SString *s, SString *t, int next[]);
int *get_nextval(SString *t);
int *get_next(SString *t);

// 计算nextval数组（优化的next数组算法）
int *get_nextval(SString *t) {
  static int nextval[MaxSize];
  int i = 1, j = 0;
  nextval[1] = 0;
  while (i < t->length) {
    if (j == 0 || t->ch[i] == t->ch[j]) {
      i++;
      j++;
      if (t->ch[i] != t->ch[j])
        nextval[i] = j;
      else
        nextval[i] = nextval[nextval[j]];
    } else
      j = nextval[j];
  }
  return nextval;
}
// 计算next数组
int *get_next(SString *t) {
  static int next[MaxSize];
  int i = 1, j = 0;
  next[1] = 0;
  while (i < t->length) {
    if (j == 0 || t->ch[i] == t->ch[j]) {
      i++;
      j++;
      next[i] = j;
    } else
      j = next[j];
  }
  return next;
}

// KMP算法的模式匹配部分
int Index_KMP(SString *s, SString *t, int next[]) {
  int i = 1, j = 1;
  // 当i越过主串的长度或者j越过模式串的长度时结束循环
  while (i <= s->length && j <= t->length) {
    if (j == 0 || s->ch[i] == t->ch[j]) {
      // 如果j==0，意味着第一个元素匹配失败
      i++;
      j++;
    } else {
      // 令j为next数组中对应的值，i的下标不变
      j = next[j];
    }
  }
  // 如果是j越过模式串的长度导致循环结束
  if (j > t->length) // 如果匹配成功，此时j的值为模式串长加1
    return i - t->length; // 返回匹配成功的子串的首字符位序
  // 如果是i越过主串的长度导致循环结束
  else
    return -1;
}
```
