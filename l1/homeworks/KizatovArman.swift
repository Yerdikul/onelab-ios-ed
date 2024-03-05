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