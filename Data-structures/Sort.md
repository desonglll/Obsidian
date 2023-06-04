---
title: Sort
date: 2023/05/30/ 19:18:56
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
