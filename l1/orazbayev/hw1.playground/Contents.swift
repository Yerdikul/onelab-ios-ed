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

//// LinkedList
//Реализуйте структуру данных LinkedList. Связный список должен состоять из узлов, каждый из которых содержит значение и ссылку на следующий узел в списке.
//
//prepend: Метод для добавления нового элемента в начало списка.
//append: Метод для добавления нового элемента в конец списка.
//remove: Метод для удаления элемента из списка. Можно реализовать удаление по значению или по индексу.
//find: метод для поиска элемента в списке по его значению, Метод возвращает первый узел, содержащий указанное значение, или nil, если такой узел не найден
//printList: Метод для печати всех значений узлов списка. Этот метод проходит по всем узлам и печатает их значения.
//
//
//let list = LinkedList<Int>()
//list.append(value: 1) // Добавление в конец
//list.prepend(value: 0) // Добавление в начало
//list.append(value: 2) // Добавление в конец
//print(list)
