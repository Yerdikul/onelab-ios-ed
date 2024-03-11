import UIKit
// task 1
class Stack<T> {
    var stack: [T] = []
    
    init() {}
    
    func push(_ element: T) {
        stack.append(element)
    }
    
    func peek() -> T? {
        if !stack.isEmpty {
            return stack.last
        }
        return nil
    }
    
    func pop() -> T? {
        if !stack.isEmpty {
            return stack.removeLast()
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func size() -> Int {
        return stack.count
    }
}

var stk = Stack<Int>()
stk.push(1)
stk.push(2)
stk.pop()
stk.pop()
print(stk.peek() ?? "Stack is empty")
print(stk.pop() ?? "Stack is empty")


// task 2

class Queue<T>{
    var queue: [T] = []
    init(){}
    
     func enqueue(_ element: T) {
        queue.append(element)
    }

    func dequeue() -> T? {
        if !queue.isEmpty {
            return queue.removeFirst()
        }
        return nil
    }
    func peek() -> T? {
            return queue.first
        }

        var isEmpty: Bool {
            return queue.isEmpty
        }
        var size: Int {
            return queue.count
        }
}

var queue = Queue<String>()
queue.enqueue("Первый")
queue.enqueue("Второй")
print(queue.peek() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Второй"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Очередь пуста"


///task 3

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T: Equatable> {
    
    var head: Node<T>?
    
    init() {}
    
    func prepend(value: T) {
        let node = Node(value: value)
        node.next = head
        head = node
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
        
        var prev: Node<T>? = nil
        var current = head
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
    
    func printList() -> String {
        var result = ""
        var current = head
        while let node = current {
            result += "\(node.value) "
            current = node.next
        }
        return result
    }


}



let list = LinkedList<Int>()
list.append(value: 1)
list.prepend(value: 0)
list.append(value: 2)
list.prepend(value: -1)
list.remove(value: 1)
list.printList()
