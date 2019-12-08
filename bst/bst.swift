
class Node {
    var value: Int
    var left: Node?
    var right: Node?

    init(value: Int) {
        self.value = value
    }
}

class BST {

    var root: Node

    init(value: Int) {
        self.root = Node(value: value)
    }

    func search(_ value: Int) -> Bool {
        return searchHelper(root, value: value)
    }

    // create a node with the given value and insert it into the binary tree
    func insert(_ value: Int) {
        insertHelper(root, value: value)
    }

    // helper method - use to implement a recursive search function
    func searchHelper(_ current: Node?, value: Int) -> Bool {
        if let current = current {
            if current.value == value {
                return true
            } else if value < current.value {
                return searchHelper(current.left, value: value)
            } else {
                return searchHelper(current.right, value: value)
            }
        }
        return false
    }

    func printInOrder() -> String{
        var str = printHelper(start: root, traverse: "")!
        str.removeLast()
        return str
    }

    func printHelper(start: Node?, traverse: String) -> String? {
        var res = traverse
        if let start = start {
            if let leftValue = printHelper(start: start.left, traverse: res) {
                res = leftValue
            }
            res += "\(start.value),"
            if let rightValue = printHelper(start: start.right, traverse: res) {
                res = rightValue
            }
        }
        return res
    }

    // helper method - use to implement a recursive insert function
    func insertHelper(_ current: Node, value: Int) {
        if value < current.value {
            if let left = current.left {
                insertHelper(left, value: value)
            } else {
                current.left = Node(value: value)
            }
        } else {
            if let right = current.right {
                insertHelper(right, value: value)
            } else {
                current.right = Node(value: value)
            }
        }
    }
}

// Test cases
// Set up tree
let tree = BST(value: 4)

// Insert elements
tree.insert(2)
tree.insert(1)
tree.insert(12)
tree.insert(9)
tree.insert(21)
tree.insert(-5)

// Check search
print(tree.search(9)) // Should be true
print(tree.search(12)) // Should be true
print(tree.search(6)) // Should be false
print(tree.search(4))


print(tree.printInOrder())
