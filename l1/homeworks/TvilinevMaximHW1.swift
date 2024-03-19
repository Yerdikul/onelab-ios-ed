//
//  TvilinevMaximHW1.swift
//  
//
//  Created by Maxim Tvilinev on 05.03.2024.
//

import Foundation

// MARK: - DataStructure protocol

protocol DataStructure: AnyObject {
    associatedtype T

    var isEmpty: Bool { get }
    var size: Int { get }

    func peek() -> T?
}

// MARK: - Stack

class Stack<T>: DataStructure {
    private var item = [T]()

    func push(_ element: T) {
        item.append(element)
    }

    func pop() -> T? {
        if item.isEmpty {
            return nil
        } else {
            return item.removeLast()
        }
    }

    func peek() -> T? {
        if item.isEmpty {
            return nil
        } else {
            return item.last
        }
    }

    var isEmpty: Bool {
        item.isEmpty
    }

    var size: Int {
        item.count
    }
}

// MARK: - Queue

class Queue<T>: DataStructure {

    private var item = [T]()

    func enqueue(_ element: T) {
        item.append(element)
    }

    func dequeue() -> T? {
        if item.isEmpty {
            return nil
        } else {
            return item.removeFirst()
        }
    }

    func peek() -> T? {
        if !item.isEmpty {
            return item.first
        } else {
            return nil
        }
    }

    var isEmpty: Bool {
        return item.isEmpty
    }

    var size: Int {
        return item.count
    }
}
// MARK: - LinkedList

class Node<T> {
    var value: T
    var nextNode: Node<T>?

    init(value: T, nextNode: Node<T>? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
}

class LinkedList<T: Equatable> {
    var node: Node<T>?

    func prepend(value: T) {
        var newNode = Node(value: value)
        newNode.nextNode = node
        node = newNode
    }

    func append(value: T) {
        var newNode = Node(value: value)
        if node == nil {
            node = newNode
            return
        }

        var currentNode = node
        while currentNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }
        currentNode?.nextNode = newNode
    }

    func remove(value: T) {
        if node?.value == value {
            node = node?.nextNode
            return
        }

        var previous: Node<T>? = nil
        var currentNode = node

        while currentNode != nil && currentNode?.value != value {
            previous = currentNode
            currentNode = currentNode?.nextNode
        }
        previous?.nextNode = currentNode?.nextNode
    }

    func find(value: T) -> Node<T>? {
         var currentNode = node

         while currentNode != nil {
             if currentNode?.value == value {
                 return currentNode
             }
             currentNode = currentNode?.nextNode
         }
         return nil
     }

    func printList() {
        while node != nil {
            print(node!.value)
            node = node?.nextNode
        }
    }
}
