class Node(value: Option[Int] = None, left: Option[Node] = None, right: Option[Node] = None) {
    def insertNew(newValue: Int): Node = value match {
        case Some(v) if(newValue < v) => insertLeft(newValue)
        case Some(v) => insertRight(newValue)
        case None => new Node(Some(newValue))
    }

    private def insertLeft(newValue: Int) = new Node(value, newChild(left, newValue), right)
    private def insertRight(newValue: Int) = new Node(value, left, newChild(right, newValue))
    private def newChild(child: Option[Node], newValue: Int) = child match {
        case Some(child) => Some(child insertNew newValue)
        case None => Some(new Node(Some(newValue)))
    }

    def getRecursiveValue[U](returnValue: Int => U): U = {
        left foreach { e => e getRecursiveValue returnValue }
        val r = returnValue(value.get)
        right foreach {e => e getRecursiveValue returnValue }
        r
    }
}

class Tree(root: Node = new Node) extends Traversable[Int] {
    def <<(value: Int) = new Tree(root insertNew value)

    def foreach[U](block: Int => U) = root getRecursiveValue block
}

object Functional extends App {
    val tree = new Tree << 
        10 << 
        1 << 
        20 << 
        2 << 
        2 << 
        5 << 
        3 << 
        12 << 
        7 << 
        6 << 
        9 << 
        11 << 
        8

    tree foreach println
    println(tree.toList)
}
