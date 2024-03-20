
import Foundation

//MARK: - Stack Prototocol
/// Methods of basic Stack
protocol Stackable {
    associatedtype T
    func push(item: T)
    func pop() -> T?
    func peek() -> T?
    func size() -> Int
    func isEmpty() -> Bool
}

// MARK: - Stack class
/// Simple Stack class which implements Stackable protocol
class Stack<T>: Stackable {
    
    private var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
    init() {
        items = []
    }
    
    func push(item: T) {
        items.append(item)
    }
    
    func pop() -> T? {
        items.count > 0 ? items.removeLast() : nil
    }
    
    func peek() -> T? {
        items.last
    }
    
    func size() -> Int {
        items.count
    }
    
    func isEmpty() -> Bool {
        items.count == 0
    }
}


//MARK: - Stack Implement
var stack = Stack<Int>()

stack.push(item: 1)
stack.push(item: 2)
print(stack.peek() ?? "Стек пуст") // Должно напечатать "2"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "2"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "1"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "Стек пуст"

//MARK: - Queueable Protocol
/// Methods of basic Queue
protocol Queueable {
    associatedtype T
    func enqueue(item: T)
    func dequeue() -> T?
    func peek() -> T?
    func isEmpty() -> Bool
    func size() -> Int
}

// MARK: - Queue class
/// Simple Queue class which implements Queable protocol
class Queue<T>: Queueable {
    
    private var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
    init() {
        items = []
    }
    
    func enqueue(item: T) {
        items.insert(item, at: 0)
    }
    func dequeue() -> T? {
        items.count > 0 ? items.removeLast() : nil
    }
    
    func peek() -> T? {
        items.last
    }
    
    func size() -> Int {
        items.count
    }
    
    func isEmpty() -> Bool {
        items.count == 0
    }
}
//MARK: - Queue Implement

var queue = Queue<String>()
queue.enqueue(item: "Первый")
queue.enqueue(item: "Второй")
print(queue.peek() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Второй"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Очередь пуста"


//MARK: - LinkedList


/// Node of Linked List
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

/// Simple Linked List structure
class LinkedList<T> where T: Equatable {
    var head: Node<T>?
    
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
        
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        
        current?.next = Node(value: value)
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
        while current != nil {
            if current?.value == value {
                return current
            }
            current = current?.next
        }
        return nil
    }
    
    func printList() {
        var current = head
        while current != nil {
            print(current!.value, terminator: " -> ")
            current = current?.next
        }
        print()
    }
}
//MARK: - Linked List Implement

let list = LinkedList<Int>()
list.append(value: 1)
list.prepend(value: 0)
list.append(value: 2)
list.printList()
//Хотел сделать с протоколами как выше, но плохо получился и оставил в классах
