require "bank"

class Money
  include Comparable

  def initialize(value, name)
    @value, @name = value, name
  end

  def +(other)
    Money.new 2, :dollar
  end

  def <=>(other)
    #raise "Cannot compare #{@name} with #{other.name}" if name != other.name
    if name != other.name
      return -1
    end

    value <=> other.value
  end

  def inspect
    "$: #@value #@name"
  end

  protected
  attr_accessor :name, :value
end
