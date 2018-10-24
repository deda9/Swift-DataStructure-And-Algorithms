struct Stack<T> {
    
    fileprivate var items: [T] = []
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var count: Int {
        return items.count
    }
    
    mutating func push(_ element: T) {
        self.items.append(element)
    }
    
    mutating func pop() -> T? {
        return self.items.popLast()
    }
    
    func peak() -> T? {
        return self.items.last
    }
}


var strStack: Stack<String> = Stack()
strStack.push("1 element")
strStack.push("2 element")
strStack.push("3 element")
strStack.push("4 element")

print(strStack)
print("stack Count", strStack.count)
print("stack is empty", strStack.isEmpty)
print("last element before pop is: ", strStack.peak()!)
print("pop last element: ",strStack.pop()!)
print("last element after pop is: ",strStack.peak()!)

