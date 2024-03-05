// Stack
class Stack<Element> {
    private var elements = [Element]()
    
    init() {}
    
    func push(_ element: Element) {
        elements.append(element)
    }
    
    func pop() -> Element? {
        return elements.popLast()
    }
    
    func peek() -> Element? {
        return elements.last
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
}

// Пример использования
var stack = Stack<Int>()
stack.push(1)
stack.push(2)
print(stack.peek() ?? "Стек пуст") // Должно напечатать "2"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "2"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "1"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "Стек пуст"
print(stack.isEmpty)
stack.push(1)
stack.push(2)
stack.push(1)
stack.push(2)
print(stack.size)


// Queue
class Queue<Element> {
    private var elements = [Element]()
    
    init() {}
    
    func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    func dequeue() -> Element? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
}

// Пример использования
var queue = Queue<String>()
queue.enqueue("Первый")
queue.enqueue("Второй")
print(queue.peek() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Второй"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Очередь пуста"

// LinkedList
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    func prepend(value: T) {
        let newNode = Node(value: value)
        newNode.next = head
        head = newNode
    }
    
    func append(value: T) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            return
        }
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = newNode
    }
    
    func remove(value: T) {
        if head?.value == value {
            head = head?.next
            return
        }
        var current = head
        var prev: Node<T>?
        while current != nil && current?.value != value {
            prev = current
            current = current?.next
        }
        prev?.next = current?.next
    }
    
    func find(value: T) -> Node<T>? {
        var current = head
        while current != nil && current?.value != value {
            current = current?.next
        }
        return current
    }
    
    func printList() {
        var current = head
        while current != nil {
            print(current!.value, terminator: " ")
            current = current?.next
        }
        print()
    }
}

// Пример использования
let list = LinkedList<Int>()
list.append(value: 1)
list.prepend(value: 0)
list.append(value: 2)
list.printList() // Должно напечатать "0 1 2 "


