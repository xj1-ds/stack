# 栈数据结构实现（Cool语言）

## 项目概述

这是一个使用Cool语言实现的基于链表的栈数据结构。该实现使用头插法进行元素插入，并通过标记节点（哨兵节点）简化栈操作的实现。

## 文件结构

- `stack.cl` - Cool语言源代码文件，包含栈数据结构的完整实现
- `stack.s` - 编译后的SPIM汇编代码

## 功能特点

- **基于链表实现** - 使用单链表存储元素
- **头插法** - 新元素总是插入到链表头部，保证O(1)时间复杂度的入栈操作
- **标记节点设计** - 使用哨兵节点简化边界条件处理
- **完整的栈操作** - 支持入栈、出栈、查看栈顶、获取栈大小、判断栈是否为空等操作

## 核心类设计

### Node类

节点类用于构建链表，包含以下字段和方法：

- `data : String` - 存储节点的数据
- `nextNode : Node` - 指向下一个节点的引用
- `init(value : String) : Node` - 初始化节点
- `getData() : String` - 获取节点数据
- `getNextNode() : Node` - 获取下一个节点
- `setNextNode(node : Node) : Node` - 设置下一个节点

### Stack类

栈类继承自IO类，提供完整的栈操作：

- `sentinelNode : Node` - 标记节点（哨兵节点）
- `stackSize : Int` - 栈大小计数器
- `init() : Stack` - 初始化空栈
- `push(element : String) : Stack` - 入栈操作
- `pop() : String` - 出栈操作
- `peek() : String` - 查看栈顶元素
- `getSize() : Int` - 获取栈大小
- `isEmpty() : Bool` - 判断栈是否为空
- `print() : Object` - 打印栈内容

### Main类

主类用于测试栈的功能，演示了栈的各种操作。

## 示例运行结果

执行该程序后，输出结果如下：

```
SPIM Version 6.5 of January 4, 2003 
 Copyright 1990-2003 by James R. Larus (larus@cs.wisc.edu). 
 All Rights Reserved. 
 See the file README for a full copyright notice. 
 Loaded: ../lib/trap.handler 
 Initial stack after pushing elements: 
 Stack (top to bottom): fourth -> third -> second -> first 
 
 Stack size: 4 
 
 Top element: fourth 
 
 Popping two elements: 
 Popped: fourth 
 Popped: third 
 
 Stack after popping: 
 Stack (top to bottom): second -> first 
 
 Popping remaining elements: 
 Popped: second 
 Popped: first 
 
 Trying to pop from empty stack: Error: Stack is empty 
 Is stack empty? Yes 
 COOL program successfully executed
```

## 技术说明

1. **标记节点（哨兵节点）**：该实现使用标记节点简化了链表操作的边界条件处理，避免了在插入和删除操作中对空链表情况的特殊判断。

2. **头插法**：新元素总是插入到标记节点之后，保证了O(1)时间复杂度的入栈操作。

3. **错误处理**：当尝试从空栈中弹出元素时，程序会返回错误消息"Error: Stack is empty"。

## 运行方法

要运行此程序，您需要使用Cool语言编译器和SPIM模拟器：

1. 使用Cool编译器编译stack.cl文件：`coolc stack.cl`
2. 使用SPIM模拟器运行生成的stack.s文件：`spim -file stack.s`

## 版权信息

SPIM模拟器版权归James R. Larus所有，本项目仅用于学习和演示目的。
