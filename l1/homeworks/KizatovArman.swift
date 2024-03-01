import Foundation

class Stack<T> {
    private var items: [T] = []
    
    func push(_ item: T) {
        items.append(item)
    }
    
    func printStack() {
        print(items)
    }
}