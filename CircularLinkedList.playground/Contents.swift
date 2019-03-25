class CircularLinkedList<T> where T: Comparable {
    
    var head: Node?
    var tail: Node?
    
    class Node {
        var value: T
        var next: Node?
        var previous: Node?
        
        init(_ value: T) {
            self.value = value
            self.next = nil
            self.previous = nil
        }
    }
    
    func append(_ value: T) {
        let node = Node(value)
        if self.head == nil {
            self.head = node
        } else {
            if head?.next == nil {
                self.head?.next = node
            }
            node.previous = tail
            tail?.next = node
        }
        self.tail = node
    }
    
    func find(_ value: T) -> Node? {
        var current = self.head
        
        while current != nil {
            if current!.value == value {
                return current
            } else {
                current = self.head?.next
            }
        }
        return nil
    }
}

 let list = CircularLinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)
list.append(22)
list.append(4)

list.find(2)?.previous?.value

list.head?.value
list.head?.next?.value
list.head?.next?.next?.value
list.head?.next?.next?.next?.value
list.tail?.value
list.tail?.next?.value
list.tail?.previous?.value
