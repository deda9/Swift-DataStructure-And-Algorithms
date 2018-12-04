class Node<T> {
    var value: T
    weak var parent: Node?
    var childs: [Node] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ node: Node) {
        node.parent = self
        childs.append(node)
    }
}

extension Node where T: Equatable {
    func search(_ value: T) -> Node? {
        if self.value == value {
            return self
        }
        
        for child in childs {
            if let foundValue = child.search(value) {
                return foundValue
            }
        }
        
        return nil
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        if !childs.isEmpty {
            text += "{ \(childs.map{ $0.description}.joined(separator: ", ")) }"
        }
        return text
    }
}

class Tester {
    static func test() {
        let parent = Node("A")
        let b = Node("B")
        let c = Node("C")
        let d = Node("D")
        let f = Node("F")
        let g = Node("G")
        
        parent.add(b)
        parent.add(c)
        c.add(d)
        c.add(f)
        b.add(g)
        
        print(parent)
        let foundValue = parent.search(g.value)
        print("found value: ", foundValue ?? "Not found")
        print("parent of found value: ", foundValue?.parent?.value ?? "Not found")
    }
}

Tester.test()
