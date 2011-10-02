class Node[A <% Ordered[A]](value: A = None, left: Option[Node[A]] = None, right: Option[Node[A]] = None) {
    def insertNew(newValue: A): Node[A] = value match {
        case v if(newValue < v) => insertLeft(newValue)
        case _ => insertRight(newValue)
    }

    private def insertLeft(newValue: A) = new Node(value, newChild(left, newValue), right)
    private def insertRight(newValue: A) = new Node(value, left, newChild(right, newValue))
    private def newChild(child: Option[Node[A]], newValue: A) = child match {
        case Some(child) => Some(child insertNew newValue)
        case None => Some(new Node(newValue))
    }

    //Quebrando o funcional...
    def getRecursiveValue[U](returnValue: A => U) {
        left foreach { e => e getRecursiveValue returnValue }
        returnValue(value)
        right foreach {e => e getRecursiveValue returnValue }
    }
}

class Tree[A <% Ordered[A]](root: Option[Node[A]] = None) extends Traversable[A] {
    def <<(value: A) = root match {
        case Some(root) => new Tree(Some(root insertNew value))
        case None => new Tree(Some(new Node[A](value)))
    }

    //Quebrando o funcional...
    def foreach[U](block: A => U) = root match {
        case Some(root) => root getRecursiveValue block
        case None => 
    }
}

object Functional extends App {
    val tree = new Tree[Int] << 10 << 1 << 20 << 2 << 2 << 5 << 3 << 12 << 7 << 6 << 9 << 11 << 8

    tree foreach println
    println(tree.toList)
}
