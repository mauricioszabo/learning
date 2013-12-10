class Tree[A <% Ordered[A]]() extends Traversable[A] {
  def << (newValue: A): Tree[A] = this match {
    case EmptyTree() => Node(newValue, EmptyTree[A], EmptyTree[A])
    case Node(value, left, right) if(newValue < value) => Node(value, left << newValue, right)
    case Node(value, left, right) => Node(value, left, right << newValue)
  }

  def foreach[U](f: (A => U)) = this match {
    case Node(value, left, right) => left foreach f; f(value); right foreach f
    case EmptyTree() =>
  }
}
case class EmptyTree[A <% Ordered[A]]() extends Tree[A]
case class Node[A <% Ordered[A]](a: A, left: Tree[A], right: Tree[A]) extends Tree[A]

object FunctionalPattern extends App {
  val tree = EmptyTree[Int] << 10 << 1 << 20 << 2 << 2 << 5 << 3 << 12 << 7 << 6 << 9 << 11 << 8
  tree foreach println
}
