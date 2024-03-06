//MARK: - Stack
class Stack<Type> {
    private var container: [Type] = []
    init() {
        
    }
    
    public func push(_ el: Type) {
        self.container.append(el)
    }
    
    public func pop() -> Type? {
        if self.container.isEmpty {
            return nil
        }
        let res = self.container.last
        self.container.popLast()
        return res
    }
    
    public func peek() -> Type? {
        if self.container.isEmpty {
            return nil
        }
        return self.container.last
    }
    
    public func isEmpty() -> Bool {
        return self.container.isEmpty
    }
    
    public func size() -> Int {
        return self.container.count
    }
}


//MARK: - Queue
class Queue<Type> {
    private var container: [Type] = []
    init() { }
    
    
}

