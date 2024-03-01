import Cocoa

var greeting = "Hello, playground"

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

struct LinkedList {
//prepend: Метод для добавления нового элемента в начало списка.
//append: Метод для добавления нового элемента в конец списка.
//remove: Метод для удаления элемента из списка. Можно реализовать удаление по значению или по индексу.
//find: метод для поиска элемента в списке по его значению, Метод возвращает первый узел, содержащий указанное значение, или nil, если такой узел не найден
//printList: Метод для печати всех значений узлов списка. Этот метод проходит по всем узлам и печатает их значения.


}

var stack = Stack<Int>()
stack.isEmpty
stack.size
stack.push(1)
stack.push(2)
print(stack.peek() ?? "Стек пуст") // Должно напечатать "2"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "2"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "1"
print(stack.pop() ?? "Стек пуст")   // Должно напечатать "Стек пуст"

var queue = Queue<String>()
queue.isEmpty
queue.enqueue("Первый")
queue.isEmpty
queue.enqueue("Второй")
queue.size
print(queue.peek() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Первый"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Второй"
print(queue.dequeue() ?? "Очередь пуста") // Должно напечатать "Очередь пуста"
