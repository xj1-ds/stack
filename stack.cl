(* 
  * 基于链表实现的栈数据结构，使用头插法和标记节点 
  *) 

(* 节点类 *) 
class Node {
    data : String;          -- 当前节点的数据
    nextNode : Node;        -- 指向下一个节点的引用

    (* 初始化节点 *) 
    init(value : String) : Node {
        {
            data <- value;
            self;
        }
    };

    (* 获取节点的值 *) 
    getData() : String {
        data
    };

    (* 获取下一个节点 *) 
    getNextNode() : Node {
        nextNode
    };

    (* 设置下一个节点 *) 
    setNextNode(node : Node) : Node {
        {
            nextNode <- node;
            self;
        }
    };
};

(* 基于链表的栈类 *) 
class Stack inherits IO {
    sentinelNode : Node;    -- 标记节点（哨兵节点）
  *
  * 基于链表实现的栈数据结构，使用头插法和标记节点
  *)

(* 节点类 *)
class Node {
    data : String;          -- 当前节点的数据
    nextNode : Node;        -- 指向下一个节点的引用

    (* 初始化节点 *)
    init(value : String) : Node {
        {
            data <- value;
            self;
        }
    };

*
  * 基于链表实现的栈数据结构，使用头插法和标记节点
  *)

(* 节点类 *)
class Node {
    data : String;          -- 当前节点的数据
    nextNode : Node;        -- 指向下一个节点的引用

    (* 初始化节点 *)
    init(value : String) : Node {
        {
            data <- value;
            self;
        }
    };

*
  * 基于链表实现的栈数据结构，使用头插法和标记节点
  *)

(* 节点类 *)
class Node {
    data : String;          -- 当前节点的数据
    nextNode : Node;        -- 指向下一个节点的引用

    (* 初始化节点 *)
    init(value : String) : Node {
        {
            data <- value;
            self;
        }
    };

*
  * 基于链表实现的栈数据结构，使用头插法和标记节点
  *)

(* 节点类 *)
class Node {
    data : String;          -- 当前节点的数据
    nextNode : Node;        -- 指向下一个节点的引用

    (* 初始化节点 *)
    init(value : String) : Node {
        {
            data <- value;
            self;
        }
    };

*
  * 基于链表实现的栈数据结构，使用头插法和标记节点
  *)

(* 节点类 *)
class Node {
    data : String;          -- 当前节点的数据
    nextNode : Node;        -- 指向下一个节点的引用

    (* 初始化节点 *)
    init(value : String) : Node {
        {
            data <- value;
            self;
        }
    };

*
  * 基于链表实现的栈数据结构，使用头插法和标记节点
  *)

(* 节点类 *)
class Node {
    data : String;          -- 当前节点的数据
    nextNode : Node;        -- 指向下一个节点的引用

    (* 初始化节点 *)
    init(value : String) : Node {
        {
            data <- value;
            self;
        }
    };

*
  * 基于链表实现的栈数据结构，使用头插法和标记节点
  *)

(* 节点类 *)
class Node {
    data : String;          -- 当前节点的数据
    nextNode : Node;        -- 指向下一个节点的引用

    (* 初始化节点 *)
    init(value : String) : Node {
        {
            data <- value;
            self;
        }
    };

  stackSize : Int <- 0;   -- 栈大小

    (* 初始化空栈，创建标记节点 *) 
    init() : Stack {
        {
            sentinelNode <- (new Node).init("SENTINEL");  -- 创建标记节点
            sentinelNode.setNextNode(new Node);            -- 设置标记节点的next为新节点
            stackSize <- 0;
            self;
        }
    };

    (* 入栈操作（使用头插法） *) 
    push(element : String) : Stack {
        let newElementNode : Node <- (new Node).init(element)
        in {
            newElementNode.setNextNode(sentinelNode.getNextNode());  -- 新节点指向标记节点的下一个节点
            sentinelNode.setNextNode(newElementNode);                 -- 标记节点指向新节点
            stackSize <- stackSize + 1;
            self;
        }
    };

    (* 出栈操作 *) 
    pop() : String {
        if isEmpty() then
            "Error: Stack is empty"
        else
        let topElementNode : Node <- sentinelNode.getNextNode()
        in {
            sentinelNode.setNextNode(topElementNode.getNextNode());  -- 标记节点指向第二个节点
            stackSize <- stackSize - 1;
            topElementNode.getData();
        }
        fi
    };

    (* 查看栈顶元素 *) 
    peek() : String {
        if isEmpty() then
            "Error: Stack is empty"
        else
            sentinelNode.getNextNode().getData()  -- 获取标记节点的下一个节点的值
        fi
    };

    (* 获取栈大小 *) 
    getSize() : Int {
        stackSize
    };

    (* 判断栈是否为空 *) 
    isEmpty() : Bool {
        stackSize = 0
    };

    (* 打印栈内容（从栈顶到栈底） *) 
    print() : Object {
        let currentNode : Node <- sentinelNode.getNextNode(),
            remainingCount : Int <- stackSize
        in {
            out_string("Stack (top to bottom): ");
            while (not (remainingCount = 0)) loop {
                out_string(currentNode.getData());
                currentNode <- currentNode.getNextNode();
                remainingCount <- remainingCount - 1;
                if (not (remainingCount = 0)) then
                    out_string(" -> ")
                else
                    out_string("\n")
                fi;
            } pool;
        }
    };
};

(* 主类用于测试栈功能 *) 
class Main inherits IO {
    main() : Object {
        let stackInstance : Stack <- (new Stack).init()
        in {
            (* 测试入栈操作 *) 
            stackInstance.push("first")
                .push("second")
                .push("third")
                .push("fourth");
            
            out_string("Initial stack after pushing elements:\n");
            stackInstance.print();
            
            (* 测试栈大小 *) 
            out_string("\nStack size: ")
                .out_int(stackInstance.getSize())
                .out_string("\n");
            
            (* 测试查看栈顶元素 *) 
            out_string("\nTop element: ")
                .out_string(stackInstance.peek())
                .out_string("\n");
            
            (* 测试出栈操作 *) 
            out_string("\nPopping two elements:\n");
            out_string("Popped: ")
                .out_string(stackInstance.pop())
                .out_string("\n");
            out_string("Popped: ")
                .out_string(stackInstance.pop())
                .out_string("\n");
            
            out_string("\nStack after popping:\n");
            stackInstance.print();
            
            (* 测试空栈操作 *) 
            out_string("\nPopping remaining elements:\n");
            out_string("Popped: ")
                .out_string(stackInstance.pop())
                .out_string("\n");
            out_string("Popped: ")
                .out_string(stackInstance.pop())
                .out_string("\n");
            
            out_string("\nTrying to pop from empty stack: ")
                .out_string(stackInstance.pop())
                .out_string("\n");
            
            out_string("Is stack empty? ")
                .out_string(if stackInstance.isEmpty() then "Yes\n" else "No\n" fi);
        }
    };
};