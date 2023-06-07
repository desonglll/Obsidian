---
title: Sort
date: 2023-06-07 19:58
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #数据结构 


## 插入排序

当使用不带哨兵的插入排序算法时，以下是一个易于理解的 C 语言代码示例：

```c
#include <stdio.h>

void insertionSort(int arr[], int n) {
    int i, j, key;

    for (i = 1; i < n; i++) {
        key = arr[i]; // 当前要插入的元素
        j = i - 1;    // 已排序部分的最后一个元素

        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j]; // 将大于当前元素的元素向后移动
            j = j - 1;
        }

        arr[j + 1] = key; // 将当前元素插入到正确的位置
    }
}

void printArray(int arr[], int n) {
    int i;
    for (i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[] = { 12, 11, 13, 5, 6 };
    int n = sizeof(arr) / sizeof(arr[0]);

    printf("Original array: ");
    printArray(arr, n);

    insertionSort(arr, n);

    printf("Sorted array: ");
    printArray(arr, n);

    return 0;
}
```

在这段代码中，`insertionSort`函数实现了插入排序算法。它通过遍历数组元素并将当前元素插入到已排序的子数组中的正确位置来完成排序。内层的`while`循环用于将较大的元素向后移动，为当前元素腾出插入的位置。

`printArray`函数用于打印数组的内容。

在`main`函数中，创建了一个整数数组`arr`并计算数组的长度。首先打印原始数组，然后调用`insertionSort`函数对数组进行排序。最后打印排序后的数组。

## 哈希排序

```c
#include <stdio.h>

// 定义哈希表大小
#define HASH_SIZE 10

// 哈希函数，将元素映射到哈希表的索引
int hash(int key) {
    return key % HASH_SIZE; // 使用取模运算将元素映射到哈希表索引
}

// 哈希排序函数
void hashSort(int arr[], int size) {
    // 创建一个哈希表
    int hashTable[HASH_SIZE] = {0}; // 初始化哈希表所有元素为0

    // 统计元素频次并存储到哈希表中
    for (int i = 0; i < size; i++) {
        int index = hash(arr[i]); // 根据哈希函数得到索引
        hashTable[index]++; // 哈希表中对应索引的元素加1，表示出现的频次
    }

    // 按照哈希表中的频次重建排序后的数组
    int index = 0;
    for (int i = 0; i < HASH_SIZE; i++) {
        while (hashTable[i] > 0) {
            arr[index] = i; // 将索引存入排序后的数组
            index++;
            hashTable[i]--; // 频次减1，继续判断是否还有相同元素
        }
    }
}

// 测试代码
int main() {
    int arr[] = {8, 4, 2, 6, 9, 1, 5, 3, 7, 0};
    int size = sizeof(arr) / sizeof(arr[0]);

    printf("原始数组：");
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }

    hashSort(arr, size);

    printf("\n排序后的数组：");
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }

    return 0;
}
```

这个版本在代码中添加了注释，解释了每个关键部分的作用和原理。这样初学者就能更容易理解代码的逻辑和功能。
