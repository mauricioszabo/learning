object StructuralTyping extends Application {
    def someMethod(duck: { def quack: String } ) {
        println(duck.quack)
    }

    someMethod(new Duck)
    someMethod(new GenericAnimal("Bark!"))
}

class Duck {
    def quack = "Quack Quack!"
}

class GenericAnimal(sound: String) {
    def quack = sound
}
