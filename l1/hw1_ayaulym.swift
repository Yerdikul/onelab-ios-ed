// Stack
class Stack<T> {
    private var elements: [T] = []
    
    init() {}
    
    func push(_ element: T) {
        elements.append(element)
    }
    
    func pop() -> T? {
        return elements.popLast()
    }
    
    func peek() -> T? {
        return elements.last
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
}

// Queue
class Queue<T> {
    private var elements: [T] = []
    
    init() {}
    
    func enqueue(_ element: T) {
        elements.append(element)
    }
    
    func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
}


class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

// LinkedList
class LinkedList<T> {
    private var head: Node<T>?
    
    init() {}
    
    func prepend(value: T) {
        let newNode = Node(value: value)
        newNode.next = head
        head = newNode
    }
    
    func append(value: T) {
        if head == nil {
            head = Node(value: value)
            return
        }
        
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(value: value)
    }
    
    func remove(value: T) {
        if head?.value == value {
            head = head?.next
            return
        }
        
        var currentNode = head
        var prevNode: Node<T>?
        while currentNode != nil && currentNode?.value != value {
            prevNode = currentNode
            currentNode = currentNode?.next
        }
        
        prevNode?.next = currentNode?.next
    }
    
    func find(value: T) -> Node<T>? {
        var currentNode = head
        while currentNode != nil {
            if currentNode?.value == value {
                return currentNode
            }
            currentNode = currentNode?.next
        }
        return nil
    }
    
    func printList() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.value, terminator: " -> ")
            currentNode = currentNode?.next
        }
        print("nil")
    }
}
