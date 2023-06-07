---
title: List
date: 2023-06-07 19:58
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #数据结构 


## 单链表

### 单链表定义

```c
// typedef int Integer;
typedef struct Node {
  int data;
  int length;
  struct Node *next;
} Node;
```

### 单链表初始化

```c
Node *newNode(int data) { // 创建一个新的Node节点
  Node *newNode = (Node *)malloc(sizeof(Node));
  if (newNode == NULL) {
    printf("malloc fail.");
    exit(-1); // 分配空间失败并退出
  }
  newNode->data = data;
  newNode->next = NULL;
  newNode->length = 0;
  return newNode;
}

Node *initList(Node *head) {
  head = (Node *)malloc(sizeof(Node)); // 为其分配空间
  if (head == NULL) {
    printf("malloc fail.");
    exit(-1); // 分配空间失败并退出
  }
  head->data = 0;
  head->next = NULL;
  head->length = 0;
  return head;
}
```

### 单链表增

```c
void headAdd(Node *head, int data) { // 头插法
  Node *p = head;
  Node *body = newNode(data);
  body->next = p->next;
  p->next = body;
  head->length++;
}

void tailAdd(Node *head, int data) {
  // 添加一个数据域元素为data的节点到head链表中
  Node *body = newNode(data); // 创建一个body节点
  Node *p = head;             // 声明一个游标
  // 此为尾插法，元素顺序与添加顺序相同
  while (p->next) // 如果p的下一个元素为NULL，即此时p为单链表最后一个节点
    p = p->next;
  body->next = p->next; // body的尾指向p的尾
  p->next = body;       // p的下一个指向body
  head->length++;       // head的长度加一
}
```

### 单链表删

```c
int delete(Node *head, int index) {
  if (index < 1 || index > head->length) { // 访问越界
    printf("invalid argument.\n");
    return -1;
  } else {
    Node *p = head; // 声明一个*p指向头节点
    for (int i = 0; i < index - 1; i++)
      // 此处index-1是为了找到要删除的元素的前一个位置的元素
      p = p->next;
    Node *tmp = p->next;
    p->next =
        tmp->next; // 把要删除的元素的前一个元素的尾指针指向要删除元素的后一个元素
    int data = tmp->data;
    free(tmp);
    head->length--;
    return data;
  }
}
```

### 单链表改

```c
int change(Node *head, int index, int data) {
  if (index < 1 || index > head->length) {
    printf("invalid argument.\n");
    return -1;
  } else {
    Node *p = head;
    for (int i = 0; i < index; i++)
      p = p->next;
    int origin = p->data;
    p->data = data;
    return origin;
  }
}
```

### 单链表查

```c
int search(Node *head, int index) {
  if (index < 1 || index > head->length) {
    printf("invalid argument.\n");
    return -1;
  } else {
    Node *p = head;
    for (int i = 0; i < index; i++)
      p = p->next;
    return p->data;
  }
}

// 元素是否在链表中
int inlist(Node *head, int data) {
  Node *p = head;
  while (p->next) {
    if (p->data == data)
      return 1; // 如果链表中存在，返回1
    p = p->next;
  }
  return -1; // 若不存在返回-1
}
```

### 单链表打印

```c
void display(Node *head) {
  Node *p = head;
  if (p->next == NULL) { // p->next==NULL说明p此时为最后一个节点
    printf("Empty list.\n");
    return;
  }
  while (p->next) {
    p = p->next;
    printf("%d ", p->data);
  }
  printf("\nLength: %d\n", head->length);
}
```

### 单链表逆置

```c
// 王道书p46的Reverse_2算法
Node *pre_reverse(Node *head) {
  Node *p = head->next, *q = p->next, *r;
  p->next = NULL;
  while (q != NULL) {
    r = p;
    p = q;
    q = q->next;
    p->next = r;
  }
  return head->next = p;
}

// 头插法实现元素逆置
Node *head_reverse(Node *head) {
  Node *p, *q;
  p = head->next;    // p指向第一个有元素的节点
  head->next = NULL; // 将head分离出来
  while (p != NULL) {
    q = p->next;          // q指向p的下一个节点
    p->next = head->next; // 头插法把q插入head中
    head->next = p;
    p = q;
  }
  return head;
}
```

## 双链表

### 双链表定义

```c
typedef struct Node {
  struct Node *prior;
  struct Node *next;
  int data;
  int length;
} Node;
```

### 双链表初始化

```c
Node *newNode(int data) {
  Node *newNode = (Node *)malloc(sizeof(Node));
  if (newNode == NULL) {
    printf("malloc fail.");
    exit(-1);
  }
  newNode->data = data;
  newNode->next = NULL;
  newNode->prior = NULL;
  return newNode;
}

Node *initList(Node *head) {
  head = (Node *)malloc(sizeof(Node));
  if (head == NULL) {
    printf("malloc fail.");
    exit(-1);
  }
  head->data = 0;
  head->length = 0;
  return head;
}
```

### 双链表增

```c
void headAdd(Node *head, int data) {
  Node *body = newNode(data);
  Node *p = head;
  if (p->next == NULL) {
    p->next = body;
    body->prior = p;
    head->length++;
  } else {
    body->next = p->next;
    p->next->prior = body;
    p->next = body;
    body->prior = p;
    head->length++;
  }
}
void tailAdd(Node *head, int data) {
  Node *body = newNode(data);
  Node *p = head;
  while (p->next)
    p = p->next;
  body->next = p->next;
  body->prior = p;
  p->next = body;
  head->length++;
}
```

### 删双链表

```c
int delete(Node *head, int index) {
  if (index < 1 || index > head->length) {
    printf("Invild argument.\n");
    return -1;
  } else {
    head->length--;
    Node *p = head;
    for (int i = 0; i < index - 1; i++)
      p = p->next;
    int data;
    Node *tmp = p->next;
    if (p->next->next == NULL) {
      p->next = NULL;
      data = tmp->data;
      free(tmp);
      return data;
    } else {
      tmp->next->prior = p;
      p->next = tmp->next;
      data = tmp->data;
      free(tmp);
      return data;
    }
  }
}
```

### 双链表改

```c
int change(Node *head, int index, int data) {
  if (index < 1 || index > head->length) {
    printf("Invild argument.\n");
    return -1;
  } else {
    Node *p = head;
    for (int i = 0; i < index; i++)
      p = p->next;
    int origin = p->data;
    p->data = data;
    return origin;
  }
}
```

### 双链表打印

```c
void display(Node *head) {
  Node *p = head;
  if (p->next == NULL) {
    printf("Empty list.\n");
    return;
  }
  while (p->next) {
    p = p->next;
    printf("%d ", p->data);
  }
  printf("Length: %d\n", head->length);
}
```

## 循环单链表

### 循环单链表定义

```c
typedef struct Node {
  int data;
  int length;
  struct Node *next;
} Node;
```

### 循环单链表初始化

```c
Node *initList(Node *head) {
  head = (Node *)malloc(sizeof(Node));
  if (head == NULL) {
    printf("malloc fail.\n");
    exit(-1);
  }
  head->data = 0;
  head->length = 0;
  head->next = head;
  return head;
}
Node *newNode(int data) {
  Node *newNode = (Node *)malloc(sizeof(Node));
  if (newNode == NULL) {
    printf("malloc fail.\n");
    exit(-1);
  }
  newNode->data = data;
  newNode->length = 0;
  newNode->next = NULL;
  return newNode;
}
```

### 循环单链表判空

```c
int isEmpty(Node *head) {
  if (head->next == head)
    return 1;
  return 0;
}
```

### 循环单链表增

```c
void tailAdd(Node *head, int data) {
  Node *body = newNode(data);
  Node *p = head;
  while (p->next != head)
    p = p->next;
  body->next = p->next;
  p->next = body;
  head->length++;
}

void headAdd(Node *head, int data) {
  Node *body = newNode(data);
  Node *p = head;
  body->next = p->next;
  p->next = body;
  head->length++;
}
```

### 循环单链表删

```c
int delete(Node *head, int index) {
  Node *p = head;
  if (index < 1 || index > head->length) {
    printf("Vaild argument.\n");
    return -1;
  } else {
    for (int i = 0; i < index - 1; i++)
      p = p->next;
    Node *tmp = p->next;
    p->next = tmp->next;
    int origin = tmp->data;
    free(tmp);
    head->length--;
    return origin;
  }
}
```

### 循环单链表打印

```c
void display(Node *head) {
  if (1 == isEmpty(head)) {
    printf("Empty List.\n");
    return;
  } else {
    Node *p = head;
    while (p->next != head) {
      p = p->next;
      printf("%d ", p->data);
    }
    printf("\nLength: %d\n", head->length);
  }
}
```

## 循环双列表

### 循环双列表定义

```c
typedef struct Node {
  int data;
  int length;
  struct Node *prior;
  struct Node *next;
} Node;
```

### 循环双列表初始化

```c
Node *newNode(int data) {
  Node *newNode = (Node *)malloc(sizeof(Node));
  if (newNode == NULL) {
    printf("malloc fail.\n");
    exit(-1);
  }
  newNode->data = data;
  newNode->length = 0;
  newNode->prior = NULL;
  newNode->next = NULL;
  return newNode;
}
Node *initList(Node *head) {
  head = (Node *)malloc(sizeof(Node));
  if (head == NULL) {
    printf("malloc fail.\n");
    exit(-1);
  }
  head->data = 0;
  head->length = 0;
  head->prior = head;
  head->next = head;
  return head;
}
```

### 循环双列表增

```c
void headAdd(Node *head, int data) {
  Node *body = newNode(data);
  Node *p = head;
  body->next = p->next;
  p->next->prior = body;
  p->next = body;
  body->prior = p;
  head->length++;
}
void tailAdd(Node *head, int data) {
  Node *body = newNode(data);
  Node *p = head;
  while (p->next != head)
    p = p->next;
  body->next = p->next;
  body->prior = p;
  p->next = body;
  head->prior = body;
  head->length++;
}
```

### 循环双列表删

```c
int delete(Node *head, int index) {
  if (index < 1 || index > head->length) {
    printf("Vaild argument.\n");
    return -1;
  } else {
    Node *p = head;
    for (int i = 0; i < index - 1; i++)
      p = p->next;
    Node *tmp = p->next;
    p->next = tmp->next;
    tmp->next->prior = p;
    int origin = tmp->data;
    free(tmp);
    head->length--;
    return origin;
  }
}
```

### 循环双列表打印

```c
void display(Node *head) {
  if (head->next == head) {
    printf("Empty List.\n");
    return;
  } else {
    Node *p = head;
    while (p->next != head) {
      p = p->next;
      printf("%d ", p->data);
    }
    printf("\nLength: %d\n", head->length);
  }
}
```

## 顺序表

### 顺序表定义

```c
typedef struct SqList {
  int data[MaxSize];
  int length;
} SqList;
```

### 顺序表初始化

```c
SqList *initList(SqList *sqlist) {
  sqlist = (SqList *)malloc(sizeof(SqList));
  for (int i = 0; i < MaxSize; i++)
    sqlist->data[i] = 0;
  sqlist->length = 0;
  return sqlist;
}
```

### 顺序表插入

```c
void insert(SqList *sqlist, int index, int data) {
  if (index < 1 || index > MaxSize) { // 数组越界
    printf("Vaild argument.\n");
    return;
  } else if (index > sqlist->length + 1) { // 数组越界
    printf("Vaild argument.\n");
    return;
  } else {
    for (int i = sqlist->length; i > index - 1; i--) {
      sqlist->data[i] = sqlist->data[i - 1];
    }
    sqlist->data[index - 1] = data;
    sqlist->length++;
  }
}
```

### 顺序表删除

```c
int delete(SqList *sqlist, int index) {
  if (index < 1 || index > MaxSize) {
    printf("Vaild argument.\n");
    return -1;
  } else if (index > sqlist->length) {
    printf("Vaild argument.\n");
    return -1;
  } else {
    int origin = sqlist->data[index - 1];
    for (int i = index; i < sqlist->length; i++) {
      sqlist->data[i - 1] = sqlist->data[i];
    }
    sqlist->length--;
    return origin;
  }
}
```

### 顺序表打印

```c
void display(SqList *sqlist) {
  if (0 == sqlist->length) {
    printf("Empty list.\n");
    return;
  } else {
    for (int i = 0; i < sqlist->length; i++)
      printf("%d ", sqlist->data[i]);
    printf("\n");
  }
}
```

### 顺序表定位

```c
int locate(SqList *sqlist, int data) {
  // return value -1 means empty list, while -2 means value not found.
  if (0 == sqlist->length) {
    printf("Empty list.\n");
    return -1;
  } else {
    for (int i = 0; i < sqlist->length; i++) {
      if (data == sqlist->data[i])
        return i + 1;
    }
    return -2;
  }
}
```
