class Money
  include Comparable
  attr_accessor :name, :value

  def initialize(value, name)
    @value, @name = value, name
  end

  def +(other)
    raise InvalidMoneyOperation if other.name != name
    return Money.new value + other.value, name
  end

  def -(other)
    raise InvalidMoneyOperation if other.name != name
    return Money.new value - other.value, name
  end

  def <=>(other)
    if name != other.name
      return -1
    end

    value <=> other.value
  end

  def <(other)
    return super if other.name == name
    false
  end

  def <=(other)
    return super if other.name == name
    false
  end

  def apply_on(bank)
    bank.apply(self)
  end

  def inspect
    "$: #@value #@name"
  end
end

class InvalidMoneyOperation < StandardError
end
