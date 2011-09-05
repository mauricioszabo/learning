class StringUtils(string: String) {
    def titleize = string.replaceAll(" ", "-").toLowerCase
}

object Implicit extends Application {
    implicit def toStringUtils(string: String) = new StringUtils(string)

    val book = "Dust in High Sea"
    println(book.titleize)
}
