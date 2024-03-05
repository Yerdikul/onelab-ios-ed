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