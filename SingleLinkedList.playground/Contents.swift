/**
 * LinkedList has a node which hold the data and a reference to the next node
 */

class LinkedList<T> where T: Comparable{
    
    var head: Node?
    var tail: Node?
    
    class Node {
        var value: T
        var next: Node? = nil
        
        init(value: T) {
            self.value = value
            self.next = nil
        }
    }
    
    func append(_ value: T) {
        let node = Node(value: value)
        if self.head == nil {
            self.head = node
        } else {
            self.tail?.next = node
        }
        
        self.tail = node
    }
    
    func preAppend(_ value: T) {
        let node = Node(value: value)
        if self.head == nil {
            self.head = node
        } else {
            let oldHead = self.head
            let oldTail = self.head?.next
            
            self.head = node
            self.head?.next = oldHead
            oldHead?.next = oldTail
        }
    }
    
    func add(_ value: T, after previousNode: Node?) {
        guard let previousNode = previousNode else {
            return
        }
        let newNode = Node(value: value)
        newNode.next = previousNode.next
        previousNode.next = newNode
    }
    
    func delete(_ value: T?) {
        guard let value = value else {
            return
        }
        var tempNode: Node? = self.head
        var prevNode: Node? = nil
        
        if tempNode != nil && tempNode!.value == value {
            self.head = tempNode?.next
            return
        }
        
        while tempNode != nil && tempNode!.value != value {
            prevNode = tempNode
            tempNode = tempNode?.next
        }
        
        if tempNode == nil {
            return
        }
        
        prevNode?.next = tempNode?.next
    }
}




var linkedList: LinkedList<Int> = LinkedList()
linkedList.append(1)

print("Initial values.... \n")
print("head value is: ", linkedList.head?.value ?? "empty")
print("tail value is: ",linkedList.tail?.value ?? "empty")

print("Append new values.... \n")
linkedList.append(12)
linkedList.append(4)
linkedList.append(55)
linkedList.append(5)

print("After appending new values.... \n")

print("head value is: ", linkedList.head?.value ?? "empty")
print("next head value is: ", linkedList.head?.next?.value ?? "empty")
print("tail value is: ",linkedList.tail?.value ?? "empty")

print("Add new value at the front.... \n")

linkedList.preAppend(3)
print("After adding new value at the front.... \n")
print("new head value is: ", linkedList.head?.value ?? "empty")
print("old head value is: ", linkedList.head?.next?.value ?? "empty")
print("tail: ",linkedList.tail?.value ?? "empty")

print("Add new value after a specific node (after head)... \n")
linkedList.add(40, after: linkedList.head)

print("After add new value after a specific node (after head) \n")
print("head value is: ",linkedList.head?.value ?? "empty")
print("next head value is: ",linkedList.head?.value ?? "empty")

print("\n")
print("head before detele is: ", linkedList.head?.value ?? "empty")
print("Deleting head...")
linkedList.delete(3)
print("head after detele is: ", linkedList.head?.value ?? "empty")
