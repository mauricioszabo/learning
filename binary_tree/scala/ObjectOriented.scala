class Node[a <% Ordered[a] ](var value: a) {
    var left: Node[a] = null
    var right: Node[a] = null
    def insertInto(node: Node[a], value: a) {
        if(value < node.value) {
            if(node.left == null) node.left = new Node(value)
            else insertInto(node.left, value)
        } else {
            if(node.right == null) node.right = new Node(value)
          else insertInto(node.right, value)
        }
    }
}

class Tree[a <% Ordered[a]] extends Traversable[a] {
    var root: Node[a] = null
    def <<(value: a) {
        if(root == null) root = new Node(value)
        else root insertInto (root, value)
    }

    override def foreach[U](block: a => U) {
        getValueOn(root, block)
    }

    private def getValueOn(node: Node[a], block: a => Any) {
        if(node.left != null) getValueOn(node.left, block)
        block(node.value)
        if(node.right != null) getValueOn(node.right, block)
    }
}

object ObjectOriented extends App {
    val tree = new Tree[Int]
    tree << 10
    tree << 1
    tree << 20
    tree << 2
    tree << 2
    tree << 5
    tree << 3
    tree << 12
    tree << 7
    tree << 6
    tree << 9
    tree << 11
    tree << 8
    
    tree foreach println
    println(tree.toList)
}
