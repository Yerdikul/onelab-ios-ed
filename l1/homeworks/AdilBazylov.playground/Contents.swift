struct Stack<Element> {
    
    private var items: [Element]
    
    var size: Int {
        items.count
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.isEmpty ? nil : items.removeLast()
    }
    
    func peek() -> Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
    init() {
        self.items = []
    }
}

struct Queue<Element> {
    
    private var items: [Element]
    
    var size: Int {
        items.count
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    mutating func enqueue(_ item: Element) {
        items.append(item)
    }
    
    mutating func dequeue() -> Element? {
        isEmpty ? nil : items.removeFirst()
    }
    
    func peek() -> Element? {
        isEmpty ? nil : items.first
    }
    
    init() {
        self.items = []
    }
}

class Node<Element> {
    
    var item: Element
    
    var next: Node?
        
    init(item: Element, next: Node? = nil) {
        self.item = item
        self.next = next
    }
}

struct LinkedList<Element> where Element: Equatable {
    var size = 0
    
    var head: Node<Element>?
    
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        size == 0
    }
    
    mutating func prepend(_ item: Element) {
        head = Node(item: item, next: head)
        tail = tail ?? head
        size += 1
    }
    
    mutating func append(_ item: Element) {
        if isEmpty {
            prepend(item)
            return
        }
        tail?.next = Node(item: item)
        tail = tail?.next
        size += 1
    }
    
    mutating func removeByIndex(_ index: Int) {
        guard index >= 0, index < size else  {
            print("Index does not exist")
            return
        }
        if index == 0 {
            removeZeroIndex()
            return
        }
        var current = head
        var numberOfJumps = index - 1
        
        while numberOfJumps > 0 {
            current = current?.next
            numberOfJumps -= 1
        }
        
        current?.next = current?.next?.next
        size -= 1
        
        func removeZeroIndex() {
            head = head?.next
            size -= 1
        }
    }
    
    mutating func removeByValue(_ value: Element) {
        guard !isEmpty else {
            print("The list is empty!")
            return
        }
        
        var current = head
        
        guard current?.item != value else {
            removeZeroIndex()
            return
        }
        
        while current != nil {
            guard let next = current?.next?.item else {
                print("No such value in the list")
                return
            }
            if next == value {
                current?.next = current?.next?.next
                size -= 1
                return
            }
            current = current?.next
        }
                
        func removeZeroIndex() {
            head = head?.next
            size -= 1
        }
    }
    
    func find(by item: Element) -> Node<Element>? {
        var current = head
        while let node = current {
            guard node.item != item else {
                return node
            }
            current = node.next
        }
        return nil
    }
    
    func printList() {
        print(self)
    }
    
    init() {}
}

// MARK: - Extensions

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return "\(head), size is \(size)"
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(item)"
        }
        return "\(item) -> \(next)"
    }
}


// MARK: - Testing

var list = LinkedList<Int>()
list.prepend(1)
print(list)
list.prepend(2)
print(list)
list.prepend(3)
list.prepend(4)
list.prepend(5)
list.prepend(6)

list.printList()
list.removeByIndex(1)
list.removeByValue(1)
list.printList()
list.find(by: 12)

print(list)

//
//var stack = Stack<Int>()
//stack.isEmpty
//stack.size
//stack.push(1)
//stack.push(2)
//print(stack.peek() ?? "Стек пуст") // Должно напечатать "2"
//print(stack.pop() ?? "Стек пуст")   // Должно напечатать "2"
//print(stack.pop() ?? "Стек пуст")   // Должно напечатать "1"
//print(stack.pop() ?? "Стек пуст")   // Должно напечатать "Стек пуст"
//
//var queue = Queue<String>()
//queue.isEmpty
//queue.enqueue("Первый")
//queue.isEmpty
//queue.enqueue("Второй")
//queue.size
//print(queue.peek() ?? "Очередь пуста") // Должно напечатать "Первый"
//print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Первый"
//print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Второй"
//print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Очередь пуста"
