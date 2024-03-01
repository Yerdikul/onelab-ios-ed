import Foundation

// reference/value types

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let person = Person(name: "Alica")

struct Team {
    var name: String
    var leader: Person
    
    mutating func rename(name: String) {
        
    }
}

let team = Team(name: "One", leader: person)
var team2 = team
team2.leader.name = "Bob"
team2.name = "tech"

print(team2.leader.name)
print(team2.name)
print(team.leader.name)


// POP VS OOP

class Bird {
    func fly() {
    }
    
    func walk(){
    }
}

class Penguin: Bird {
    func swim () {
    }
}

let penguin = Penguin()
penguin.fly()

protocol Walkable {
    func walk()
}
protocol Swimmable {
   func swim()

}
protocol Flyable {
   func fly()
}

class PenguinPOP: Walkable, Swimmable {
    func swim() {
    }
    
    func walk() {
    }
    
}

class Printer {
    func printItem(item: Any) {
        print("Item: \(item)")
    }
}

class StringPrinterOOP: Printer {
    override func printItem(item: Any) {
        guard let item = item as? String else { return }
        print("String item: \(item)")
    }
}

class IntPrinterOOP: Printer {
    override func printItem(item: Any) {
        guard let item = item as? Int else { return }
        print("Int item: \(item)")
    }
}

protocol Printable {
    associatedtype ItemType
    func printItem(item: ItemType)
}

struct StringPrinter: Printable {
    typealias ItemType = String
    func printItem(item: String) {
        print("String item: \(item)")
    }
    
}


// ARC

class Author {
    let name: String
    var books: [Book?] = []
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Память автора \(name) освобождена")
    }
}

class Book {
    let title: String
    var author: Author? // Используем сильную ссылку
    
    init(title: String, author: Author?) {
        self.title = title
        self.author = author
    }
    
    deinit {
        print("Память книги \(title) освобождена")
    }
}

var author: Author? = Author(name: "Mukhtar")
var book: Book? = Book(title: "Abay joly", author: author)

author?.books.append(book!)
author?.books[0] = nil

author = nil
book = nil

