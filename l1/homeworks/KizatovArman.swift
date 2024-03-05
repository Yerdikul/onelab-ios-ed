import Foundation

class Stack<T> {
    private var items: [T] = []
    
    func push(_ item: T) {
        items.append(item)
    }

    func isEmpty() -> Bool {
        items.isEmpty
    }
    
    func size() -> Int {
        items.count
    }
    
    func peek() -> T? {
        items.isEmpty ? nil : items.last
    }
    
    func pop() -> T? {
        items.isEmpty ? nil : items.removeLast()
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
print(stack.peek() ?? "Стек пуст") // Должно напечатать "2" -> True
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "2" -> True
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "1" -> True
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "Стек пуст" -> True

class Queue<T> {
    private var items: [T] = []
    
    func enqueue(_ item: T) {
        items.append(item)
    }

    func isEmpty() -> Bool {
        items.isEmpty
    }
    
    func size() -> Int {
        items.count
    }
    
    func peek() -> T? {
        items.isEmpty ? nil : items.first
    }
    
    func dequeue() -> T? {
        items.isEmpty ? nil : items.removeFirst()
    }
}

var queue = Queue<String>()
queue.enqueue("Первый")
queue.enqueue("Второй")
print(queue.peek() ?? "Очередь пуста") // Должно напечатать "Первый" -> True
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Первый" -> True
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Второй" -> True
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Очередь пуста" -> True

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T: Equatable> {
    var head: Node<T>?
    
    func prepend(value: T) {
        let node = Node(value: value)
        node.next = head
        head = node
    }
    
    func printList() {
        var elements: [T] = []
        var current = head
        
        while current != nil {
            elements.append(current!.value)
            current = current?.next
        }
        
        print(elements)
    }
    
    func find(value: T) -> Node<T>? {
        var current = head
        while current != nil && current?.value != value {
            current = current?.next
        }
        
        return current
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
    
    func remove(byValue value: T) {
        guard head != nil else {
            return
        }
        
        if head?.value == value {
            head = head?.next
            return
        }
        
        var current = head
        var previous: Node<T>?
        
        while current != nil && current?.value != value {
            previous = current
            current = current?.next
        }
        
        previous?.next = current?.next
    }
    
    func remove(byIndex index: Int) {
        guard head != nil, index >= 0 else {
            return
        }
        
        if index == 0 {
            head = head?.next
            return
        }
        
        var current = head
        var previous: Node<T>?
        var currentIndex = 0
        
        while current != nil && currentIndex != index {
            previous = current
            current = current?.next
            currentIndex += 1
        }
        
        previous?.next = current?.next
    }
}

let list = LinkedList<Int>()
list.append(value: 1) // Добавление в конец
list.prepend(value: 0) // Добавление в начало
list.append(value: 2) // Добавление в конец
let findNegative = list.find(value: -1)
print(findNegative != nil ? findNegative?.value : "Not found")
let findTwo = list.find(value: 2)
print(findTwo != nil ? findTwo?.value : "Not found")
list.remove(byValue: 1)
list.printList()