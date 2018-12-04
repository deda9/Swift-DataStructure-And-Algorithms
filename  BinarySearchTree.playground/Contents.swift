class Node<T> {
    var value : T
    weak var leftNode: Node?
    weak var rightNode: Node?
    
    init(left: Node? = nil, value: T, right: Node? = nil) {
        self.value = value
        self.leftNode = left
        self.rightNode = right
    }
}

class BinarySearchTree<T> where T: Comparable {
    
    weak var root: Node<T>?
    
    func addNode(_ value: T) {
        let node = Node(value: value)
        guard let root = self.root else {
            self.root = node
            return
        }
        self.insert(root, node: node)
    }
    
    private func insert(_ root: Node<T>, node: Node<T>) {
        if node.value > root.value {
            if let right = root.rightNode {
                self.insert(right, node: node)
            } else {
                root.rightNode = node
            }
        } else if node.value < root.value {
            if let left = root.leftNode {
                self.insert(left, node: node)
            } else {
                root.leftNode = node
            }
        }
    }
    
    func search(root: Node<T>, value: T) -> Node<T>? {
        if root.value ==  value {
            return root
        } else if let left = root.leftNode, value < root.value {
            return self.search(root: left, value: value)
        }else if let right = root.rightNode, value > root.value {
            return self.search(root: right, value: value)
        }else {
            return nil
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {

    var description: String {
        var text = ""
        if let root = self.root {
            text += "root = \(root.value), "
        }

        func getChilds(_ node: Node<T>) -> String {
            if let left = node.leftNode {
                text += "{ "
                text += "left = \(left.value) "
                text += getChilds(left)
            }

            if let right = node.rightNode {
                text += "righ = \(right.value) "
                text += getChilds(right)
                text += "} "
            }
            return ""
        }
        if let root = self.root {
            text += getChilds(root)
        }

        return text
    }
}

class Tester {
    static func test() {
        let bst = BinarySearchTree<Int>()
        [8, 2, 10, 9, 11, 1, 7].forEach { bst.addNode($0) }
        print(bst)

        let foundValue = bst.search(root: bst.root!, value: 8)
        print("found value left node: ", foundValue?.leftNode?.value ?? "not found")
        print("found value right node: ", foundValue?.rightNode?.value ?? "not found")
    }
}

Tester.test()
