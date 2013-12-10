abstract class Tree[A <% Ordered[A]] {
  def <<(element: A): Tree[A]
  def foreach(f: A => Unit): Unit
}

case class EmptyTree[A <% Ordered[A]] extends Tree[A] {
  def <<(element: A) = Node(element, EmptyTree[A](), EmptyTree[A]())
  def foreach(f: A => Unit) { }
}

case class Node[A <% Ordered[A]](value: A, left: Tree[A], right: Tree[A]) extends Tree[A] {
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

object FunctionalOO extends App {
  val tree = EmptyTree[Int]() << 10 << 1 << 20 << 2 << 2 << 5 << 3 << 12 << 7 << 6 << 9 << 11 << 8
  tree foreach println
}
