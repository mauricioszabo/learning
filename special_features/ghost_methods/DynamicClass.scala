class DynamicClass extends Dynamic {
    def applyDynamic(name: String)(args: Any*) = {
        println("Método " + name + " foi chamado!")
    }
}

object DynamicClass extends App {
    val d = new DynamicClass
    d.metodoQualquer
}
