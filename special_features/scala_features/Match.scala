class BeginsWith(letter: Char) {
    def unapply(string: String): Option[String] = {
        val first = string(0)
        if(first == letter) Some(string.slice(1, string.length))
        else None
    }
}

object Match extends Application {
    val str = "New String"
    val str2 = "Mew String"
    val begM = new BeginsWith("M"(0))

    println(str)
    str match {
        case begM(rest) => println("Match! Rest: " + rest)
        case _ => println("Does not match")
    }

    println(str2)
    str2 match {
        case begM(rest) => println("Match! Rest: " + rest)
        case _ => println("Does not match")
    }
}
