---
title: Tree
date: 2023-06-07 19:57
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #数据结构

## 二叉树的性质

$n=n_0+n_1+n_2$
$n_0=n_2+1$

## 遍历顺序对应关系

树、森林、二叉树的不同顺序遍历之间的对应

| 树       | 森林     | 二叉树   |
| -------- | -------- | -------- |
| 先序遍历 | 先序遍历 | 先序遍历 |
| 后序遍历 | 中序遍历 | 中序遍历 |
| 层次遍历 |          | 后序遍历 |

## 二叉树

### 二叉树定义

```cpp
typedef struct node {
  char data;
  struct node *lchild, *rchild;
} *BitTree;
```

### 先序遍历的方式创建二叉树

```cpp
// 先序遍历的方式创建二叉树
void CreateBitTree(BitTree &T) {
  char c;
  cin >> c;
  if (c == '0')
    T = nullptr;
  else {
    T = new node;
    T->data = c;
    CreateBitTree(T->lchild);
    CreateBitTree(T->rchild);
  }
}
```

### 二叉树的先、中、后序遍历输出

```cpp
// 将二叉树按照先序遍历的方式输出
void PreOrderTraverse(BitTree T) {
  if (T != NULL) {
    cout << T->data << " ";
    PreOrderTraverse(T->lchild);
    PreOrderTraverse(T->rchild);
  }
}

// 将二叉树按照中序遍历的方式输出
void InOrderTraverse(BitTree T) {
  if (T != NULL) {
    cout << T->data << " ";
    InOrderTraverse(T->lchild);
    InOrderTraverse(T->rchild);
  }
}

// 将二叉树按照后序遍历的方式输出
void PostOrderTraverse(BitTree T) {
  if (T != NULL) {
    cout << T->data << " ";
    PostOrderTraverse(T->lchild);
    PostOrderTraverse(T->rchild);
  }
}
```

### 求二叉树的叶子结点数

```cpp
// 二叉树的叶子节点个数
int Leaf(BitTree T) {
  if (nullptr == T)
    return 0;
  if (nullptr == T->lchild && nullptr == T->rchild)
    return 1;
  return Leaf(T->lchild) + Leaf(T->rchild);
}
```

### 求二叉树深度

```cpp
// 二叉树的深度
int Deepth(BitTree T) {
  if (T == nullptr)
    return 0;
  int x = Deepth(T->lchild);
  int y = Deepth(T->rchild);
  return max(x, y) + 1;
}
```

### 二叉树转中缀表达式（将树中序输出）

```cpp
/*
 * 实现的是括号匹配
 */

typedef struct node {
  char data[10];
  struct node *left, *right;
} BTree;

void BtreeToExp(BTree *root, int deep) {
  if (root == nullptr)
    return;
  if (root->left == nullptr && root->right == nullptr) {
    // 判断是否是叶子节点
    cout << root->data;
  } else {        // 如果不是叶子节点
    if (deep > 1) // deep>1说明我是子表达式
      cout << "(";
    BtreeToExp(root->left, deep + 1);
    cout << root->data;
    BtreeToExp(root->right, deep + 1);
    if (deep > 1) // deep>1说明我是子表达式
      cout << ")";
  }
}

void BtreeToE(BTree *node) {
  // 根的高度为1
  BtreeToExp(node, 1);
}
```

### 卡特兰数

![[Stack#卡特兰数]]

### 计算带权路径长度

基于先序遍历的算法

```cpp
typedef struct node {
  int weight;
  struct node *lchild, *rchild;
} node, *BiTree;

// 基于先序遍历的算法
int wpl_PreOrder(BiTree root, int deep) {
  static int wpl = 0; // 定义一个static变量存储wpl
  if (root->lchild == nullptr && root->rchild == nullptr) {
    // 如果是叶子节点
    wpl += deep * root->weight;
  }
  if (root->lchild != nullptr) // 若左子树不空，对左子树递归遍历
    wpl_PreOrder(root->lchild, deep + 1);
  if (root->rchild != nullptr) // 若右子树不空，对左子树递归遍历
    wpl_PreOrder(root->rchild, deep + 1);
  return wpl;
}
```

### 交换二叉树结点左右子树的递归算法

```cpp
Bitree *function(Bitree *bt) {
  Bitree *t, *t1, *t2;
  if (bt == NULL)
    t = NULL;
  else {
    t = (Bitree *)malloc(sizeof(Bitree));
    t->data = bt->data;
    t1 = function(bt->left);
    t2 = function(bt->right);
    t->left = t2;
    t->right = t1;
  }
  return (t);
}
```

### 计算二叉树中的节点总数

```cpp
// 计算二叉树中的节点总数
int countNode(BitTree T) {
  if (T != nullptr) {
    int x = countNode(T->lchild);
    int y = countNode(T->rchild);
    return 1 + x + y;
  } else
    return 0;
}
```
