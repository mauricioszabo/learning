import Ordering.Implicits._

abstract class Tree[A: Ordering] {
  def <<(element: A): Tree
  def foreach(f: A => Unit): Unit
}

object EmptyTree[A: Ordering] extends Tree[A] {
  def <<(element: A) = Node(element)
  def foreach(f: A => Unit) { }
}

case class Node[A: Ordering](value: A, left: Tree = EmptyTree, right: Tree = EmptyTree) extends Tree {
  def <<(newValue: A) = if(newValue < value)
    Node(value, left << newValue, right)
  else
    Node(value, left, right << newValue)

  def foreach(f: A => Unit) {
    left foreach f
    f(value)
    right foreach f
  }
}

object FunctionalHaskell2 extends App {
    val tree = EmptyTree << 10 << 1 << 20 << 2 << 2 << 5 << 3 << 12 << 7 << 6 << 9 << 11 << 8

    tree foreach println
    //println(tree.toList)
}
