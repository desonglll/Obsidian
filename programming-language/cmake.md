---
title: cmake
date: 2023-06-07 14:28
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #CMake
- #C语言 
- #编程语言

当涉及到 CMake 代码时，以下是一个基本的示例，涵盖了 CMake 的基础语法：

```cmake
# 设置项目的最低版本要求
cmake_minimum_required(VERSION 3.0)

# 设置项目名称
project(MyProject)

# 添加源文件
set(SOURCES
    src/main.cpp
    src/foo.cpp
    src/bar.cpp
)

# 添加可执行文件并链接源文件
add_executable(MyExecutable ${SOURCES})

# 添加头文件搜索路径
include_directories(include)

# 添加链接库搜索路径
link_directories(lib)

# 添加链接的库
target_link_libraries(MyExecutable
    lib1
    lib2
)

# 设置编译选项
set(CMAKE_CXX_FLAGS "-std=c++11 -Wall")

# 设置输出路径
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
```

上述示例代码包括以下内容：

- `cmake_minimum_required`：设置要求的 CMake 最低版本。
- `project`：设置项目名称。
- `set`：添加源文件到变量。
- `add_executable`：创建可执行文件并链接源文件。
- `include_directories`：添加头文件搜索路径。
- `link_directories`：添加链接库搜索路径。
- `target_link_libraries`：链接库到可执行文件。
- `set`：设置编译选项。
- `set`：设置输出路径。

请根据你的具体项目需求进行相应的修改和扩展。
