require "money"
require "test/unit"

class TestMoney < Test::Unit::TestCase

  def setup
    @one_dollar = Money.new 1, :dollar
    @two_francs = Money.new 2, :franc
  end

  def test_add_dollars_to_dollars
    assert_equal Money.new(2, :dollar), @one_dollar + @one_dollar
    assert (@one_dollar + @one_dollar) < Money.new(3, :dollar)
    assert (@one_dollar + @one_dollar) <= Money.new(2, :dollar)
  end

  def test_subtract_dollars_to_dollars
    assert_equal Money.new(1, :dollar), Money.new(2, :dollar) - @one_dollar
  end

  def test_cant_compare_dollars_and_francs
    assert @one_dollar != @two_francs
    assert !(@one_dollar > @two_francs)
    assert !(@one_dollar >= @two_francs)
    assert !(@one_dollar < @two_francs)
    assert !(@one_dollar <= @two_francs)
  end

  def test_cant_add_dolars_and_francs
    assert_raise(InvalidMoneyOperation) do
      @one_dollar + @two_francs
    end
  end

  def test_cant_subtract_dolars_and_francs
    assert_raise(InvalidMoneyOperation) do
      @one_dollar - @two_francs
    end
  end

  def test_can_apply_the_money_on_a_bank
    @bank = Object.new
    @bank.extend Test::Unit::Assertions
    one_dollar = @one_dollar
    @bank.class.send :define_method, :apply do |m|
      assert_same one_dollar, m
    end
    @one_dollar.apply_on @bank
  end
end
