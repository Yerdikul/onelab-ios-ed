import UIKit
import Foundation

class Stack<T> {

   private var stackItems: [T]

   init() {
       stackItems = []
   }

   var size: Int {
       return stackItems.count
   }

   var isEmpty: Bool {
       return stackItems.isEmpty
   }

   public func push(_ item: T) {
       stackItems.append(item)
   }

   public func pop() -> T? {
       return isEmpty ? nil : stackItems.removeLast()
   }

   public func peek() -> T? {
       return isEmpty ? nil : stackItems.last
   }
}


class Queue<T> {
   private var queueItems: [T]

   init() {
       queueItems = []
   }

   var size: Int {
       return queueItems.count
   }

   var isEmpty: Bool {
       return queueItems.isEmpty
   }

   public func enqueue(_ item: T) {
       queueItems.append(item)
   }
   
   public func dequeue() -> T? {
       return isEmpty ? nil : queueItems.removeFirst()
   }

   public func peek() -> T? {
       return isEmpty ? nil : queueItems.first
   }
}

class Node<T: Equatable> {
    var val: T
    var next: Node?
    weak var previous: Node?
    
    init(_ value: T) {
        self.val = value
    }
    
}

class LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var size: Int {
        var node = head
        var count = 0
        while node != nil {
            count += 1
            node = node?.next
        }
        return count
    }
    
    public var last: Node<T>? {
        guard var node = head else {
          return nil
        }

        while let next = node.next {
          node = next
        }
        return node
    }
    
    public func append(value: T) {
        let newNode = Node(value)
        if let lastNode = last {
          newNode.previous = lastNode
          lastNode.next = newNode
        } else {
          head = newNode
        }
    }
    
    public func prepend(value: T) {
        let newNode = Node(value)
        newNode.next = head
        head?.previous = newNode
        head = newNode
    }
    
    public func printList() -> String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.val)"
            node = node!.next
            if node != nil { s += ", " }
       }
       return s + "]"
    }
    
    public func remove(value: T) {
        if self.head?.val == value {
            self.head = self.head?.next
            return
        }
        
        if self.head?.next != nil {
            var currentNode = self.head
            var previousNode: Node<T>?
            
            while currentNode?.val != value && currentNode?.next != nil {
                previousNode = currentNode!
                currentNode = currentNode?.next
            }
            
            if currentNode?.val == value {
                previousNode?.next = (currentNode?.next != nil) ? currentNode?.next : nil
            }
        }
    }
    
    public func find(atIndex index: Int) -> Node<T>? {
        if isEmpty || index > size {
            return nil
        }
        
        if index == 0 {
            return head!
        } else {
            var node = head?.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { break }
            }
            return node!
        }
    }
    
    public func find(value: T) -> Node<T>? {
        if isEmpty { return nil }
        
        if self.head?.val == value {
            return head
        }
        
        if self.head?.next != nil {
            var currentNode = self.head
            
            while currentNode?.val != value && currentNode?.next != nil {
                currentNode = currentNode?.next
            }
            
            if currentNode?.val == value { return currentNode }
        }
        
        return nil
    }
    
    public func removeAt(_ index: Int) {
        if index < size {
            let removingNode = find(atIndex: index)
            remove(value: removingNode!.val)
        }
    }
}
