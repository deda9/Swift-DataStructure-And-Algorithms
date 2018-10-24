struct Queue<T> {
    fileprivate var items: [T] = []
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var count: Int {
        return items.count
    }
    
    mutating func enqueue(_ element: T) {
        self.items.append(element)
    }
    
    mutating func dequeue() -> T? {
        return self.isEmpty ? nil : self.items.removeFirst()
    }
    
    var front: T? {
        return items.first
    }
    
    var head: T? {
        return items.last
    }
}

var strQueue: Queue<String> = Queue()
strQueue.enqueue("1 element")
strQueue.enqueue("2 element")
strQueue.enqueue("3 element")
strQueue.enqueue("4 element")

print(strQueue)
print("front before dequeue: ", strQueue.front!)
print("head before dequeue: ",strQueue.head!)
print("dequeued element: ", strQueue.dequeue()!)

print("front after dequeue", strQueue.front!)
print("head after dequeue", strQueue.head!)

