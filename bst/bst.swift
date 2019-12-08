class Node {
    
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BinaryTree {
    
    var root: Node
    
    init(rootValue: Int) {
        self.root = Node(value: rootValue)
    }
    
    // Return true if the value is in the tree, otherwise return false
    func search(_ value: Int) -> Bool {
        return preorderSearch(root, value: value)
    }
    
    // Return a string containing all tree nodes as they are visited in a pre-order traversal.
    func printTree() -> String {
        var res = preorderPrint(root, traverse: "")!
        res.removeLast()
        return res
    }
    
    // Helper method - use to create a recursive search solution.
    func preorderSearch(_ start: Node?, value: Int) -> Bool {
        if let start = start {
            if start.value == value {
                return true
            } else {
                return preorderSearch(start.left, value: value) || preorderSearch(start.right, value: value)
            }
        }
        return false
    }
    
    // Helper method - use to construct a string representing the preordered nodes
    func preorderPrint(_ start: Node?, traverse: String) -> String? {
        var res = traverse
        if let start = start {
            res += "\(start.value)-"
            if let newValue = preorderPrint(start.left, traverse: res) {
                res = newValue
            }
            if let newValue = preorderPrint(start.right, traverse: res) {
                res = newValue
            }
        }
        return res
    }
}

// Test cases
// Set up tree
let tree = BinaryTree(rootValue: 1)
tree.root.left = Node(value: 2)
tree.root.right = Node(value: 3)
tree.root.left?.left = Node(value: 4)
tree.root.left?.right = Node(value: 5)

// Test search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false

// Test printTree
print(tree.printTree()) // Should be 1-2-4-5-3

