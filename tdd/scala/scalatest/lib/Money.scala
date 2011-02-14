package lib {

class Bank {
    def apply(money: Money) {
    }
}

class InvalidMoneyOperation extends Exception

abstract class AMoney;
class Money(mValue:Int, mName:Symbol) extends AMoney with Ordered[Money] {
    val value = mValue
    val name = mName

    def +(other: Money) = {
        if(other.name != name) throw new InvalidMoneyOperation()
        new Money(value + other.value, name)
    }

    def -(other: Money) = {
        if(other.name != name) throw new InvalidMoneyOperation()
        new Money(value - other.value, name)
    }

    override def equals(other: Any) = other match {
        case other: Money => (name == other.name && value == other.value)
        case _ => super.equals(other)
    }

    override def compare(other: Money) = if(name == other.name) value.compare(other.value) else -1

    override def <(other: Money) = if(name == other.name) super.<(other) else false
    override def <=(other: Money) = if(name == other.name) super.<=(other) else false

    def apply_on(bank: Bank) {
        bank apply this
    }

    override def toString() = "$: " + value + " " + name
}

}
