//MARK: - Stack
class Stack<Type> {
    private var container: [Type] = []
    init() {
        
    }
    
    public func push(_ el: Type) {
        self.container.append(el)
    }
    
    public func pop() -> Type? {
        return self.container.popLast()
    }
    
    public func peek() -> Type? {
        return self.container.last
    }
    
    public func isEmpty() -> Bool {
        return self.container.isEmpty
    }
    
    public func size() -> Int {
        return self.container.count
    }
}


//MARK: - Queue
class Queue<Type> {
    private var container: [Type] = []
    init() { }
    
    public func enqueue(_ el: Type) {
        self.container.append(el)
    }
    
    public func dequeue() -> Type? {
        guard !self.container.isEmpty else { return nil }
        return self.container.removeFirst()
    }
    
    public func peek() -> Type? {
        return self.container.first
    }
    
    public func isEmpty() -> Bool {
        return self.container.isEmpty
    }
    
    public func size() -> Int {
        return self.container.count
    }
}

class Node<Type: Equatable> {
    var val: Type
    var prev: Node?
    var next: Node?
    
    init(val: Type, prev: Node? = nil, next: Node? = nil) {
        self.val = val
        self.prev = prev
        self.next = next
    }
    
    deinit {
        print("Node \(self.val) deinited.")
    }
}


//MARK: - LinkedList
class LinkedList<Type: Equatable>: CustomStringConvertible {
    var root: Node<Type>?
    private var size = 0
    
    public func append(_ val: Type) {
        size += 1
        guard let root = root else { self.root = Node<Type>(val: val); return }
        var current: Node<Type> = root
        while current.next != nil {
            current = current.next!
        }
        let newNode = Node<Type>(val: val)
        newNode.prev = current
        current.next = newNode
    }
    
    public func prepend(_ val: Type) {
        size += 1
        guard let root = root else { self.root = Node<Type>(val: val); return }
        let newNode = Node<Type>(val: val)
        let rootCopy = Node<Type>(val: root.val)
        newNode.next = rootCopy
        rootCopy.prev = newNode
        guard let rootNext = root.next else {
            self.root = newNode
            return
        }
        rootCopy.next = rootNext
        rootNext.prev = rootCopy
        
        self.root = newNode
    }
    
    public func remove(at index: Int) {
        if size < index + 1 { return }
        size -= 1
        if index == 0 {
            self.root = root!.next
            return
        }
        var current = root
        for _ in 0..<index {
            current = current!.next
        }
        current!.prev!.next = current!.next
        current!.next!.prev = current!.prev
    }
    
    public func find(_ val: Type) -> Node<Type>? {
        var current = root
        while current != nil {
            if current!.val == val { return current }
            current = current!.next
        }
        return current
    }
    
    public func printList() {
        var current = root
        var result = ""
        while current != nil {
            result += "\(current!.val) "
            current = current!.next ?? nil
        }
        print(result)
    }
    
    public var description: String {
        var current = root
        var result = ""
        while current != nil {
            result += "\(current!.val) "
            current = current!.next ?? nil
        }
        return result
    }
    
}


