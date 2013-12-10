import akka.actor._

case class Insert[A <% Ordered[A]](id: Int, element: A)
case class Inserted(id: Int)
case class Error(id: Int)

case class Fn[A](id: Int, fn: A => Unit)
case class Finished(id: Int)

class Tree[A <% Ordered[A]] extends Actor {
  def receive = empty

  def empty: Receive = {
    case Insert(id, element) => element match {
      case e: A =>
        context become tree(e, newEmpty, newEmpty)
        sender ! Inserted(id)
    }
    case Fn(id, _) => sender ! Finished(id)
  }

  private def newEmpty: ActorRef = context actorOf Props(new Tree[A])

  def tree(element: A, left: ActorRef, right: ActorRef): Receive = {
    case Insert(id, e: A) => if(e <= element) left ! Insert(id, e) else right ! Insert(id, e)
    case i: Inserted => context.parent ! i

    case Fn(id, fn: (A => Unit)) =>
      pendingFns += (id -> fn)
      left ! Fn(id, fn)

    case Finished(id) =>
      pendingFns get id match {
      case Some(fn) =>
        fn(element)
        pendingFns -= id
        right ! Fn(id, fn)
      case None => context.parent ! Finished(id)
    }
  }
  var pendingFns = Map[Int, A => Unit]()
}

class Main extends Actor {
  val root = context actorOf Props(new Tree[Int])

  var receiveCount = 0
  List(10, 1, 20, 2, 2, 5, 3, 12, 7, 6, 9, 11, 8).zipWithIndex.foreach { case(e, id) =>
    root ! Insert(id, e)
  }

  root ! Fn(120, { e: Int => println("Element: " + e) })

  def receive = {
    case Finished(id) =>
      println("Resolved!")
      context stop self
  }
}

object Main {
  def main(args: Array[String]) = akka.Main.main(Array("Main"))
}
