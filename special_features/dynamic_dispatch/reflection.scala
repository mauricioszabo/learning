object Reflection extends Application {
    val string = "A string"
    val methods = string.getClass.getMethods
    val Some(method) = methods.find( m => m.getName == "toUpperCase" && m.getParameterTypes.length == 0 )

    println(method.invoke(string))
}

class Sendable(obj: Object) {
    def send(methodName: Symbol, params: Object*) = findMethod(methodName, params:_*) match {
        case Some(method) => method.invoke(obj, params:_*)
        case _ => throw new MethodMissing()
    }

    private def findMethod(sym: Symbol, params: Object*) = {
        val paramClasses = params.map(_.getClass).toList
        obj.getClass.getMethods.find( m => m.getName == sym.name && m.getParameterTypes.toList == paramClasses)
    }
}

object Send extends Application {
    implicit def object2sendable(obj: Object) = new Sendable(obj)

    val string = "Something"
    println(string.send('toUpperCase))
    println(string.send('lastIndexOf, "t"))
}

class MethodMissing extends Exception
