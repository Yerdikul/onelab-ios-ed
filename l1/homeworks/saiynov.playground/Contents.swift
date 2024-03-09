import UIKit

//MARK: Stack
struct Stack<T> {
    
    private var elements = [T]()
    
    init(){}
    
    func peek() -> T?{
        return elements.last
    }
    
    mutating func push(_ element: T){
        elements.append(element)
    }
    
    mutating func pop() -> T?{
        return elements.popLast()
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
print(stack.peek() ?? "Стек пуст") // Должно напечатать "2"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "2"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "1"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "Стек пуст"



//MARK: Queue
struct Queue<T> {
    private var elements = [T]()
    
    init(){}
    
    mutating func enqueue(_ element: T){
        elements.append(element)
    }
    
    mutating func dequeue() -> T?{
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    mutating func peek() -> T?{
        return elements.isEmpty ? nil : elements.first
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
}

var queue = Queue<String>()
queue.enqueue("Первый")
queue.enqueue("Второй")
print(queue.peek() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Второй"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Очередь пуста"


//MARK: Linked List

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T: Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func prepend(value: T) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
    }
    
    func append(value: T) {
        let newNode = Node(value: value)
        if tail == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func remove(value: T) {
        var currentNode = head
        var previousNode: Node<T>?
        
        while currentNode != nil {
            if currentNode?.value == value {
                if previousNode != nil {
                    previousNode?.next = currentNode?.next
                    if currentNode?.next == nil {
                        tail = previousNode
                    }
                } else {
                    head = currentNode?.next
                    if head == nil {
                        tail = nil
                    }
                }
                break
            }
            previousNode = currentNode
            currentNode = currentNode?.next
        }
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
            print(currentNode!.value, terminator: " ")
            currentNode = currentNode?.next
        }
        print()
    }
}

let list = LinkedList<Int>()
list.append(value: 1)
list.prepend(value: 0)
list.append(value: 2)
list.printList()


