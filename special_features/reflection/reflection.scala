object Reflection extends Application {
    val string = "A string"
    val methods = string.getClass.getMethods
    val methodNames = methods.map(_.getName).toList

    println(methodNames)
}
