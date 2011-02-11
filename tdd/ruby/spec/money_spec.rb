require "money"

describe Money do
  before do
    @one_dollar = Money.new 1, :dollar
    @two_francs = Money.new 2, :franc
  end

  it 'should be able to add dollars to dollars' do
    (@one_dollar + @one_dollar).should == Money.new(2, :dollar)
    (@one_dollar + @one_dollar).should < Money.new(3, :dollar)
  end

  it 'should be unable to compare dollars and francs' do
    #proc do
    @one_dollar.should_not == @two_francs
    #end.should raise_error
    @one_dollar.should_not > @two_francs
    @one_dollar.should_not >= @two_francs
    @one_dollar.should_not < @two_francs
    @one_dollar.should_not <= @two_francs
  end

  it 'should be unable to add dolars and francs' do
    pending
    proc do
      @one_dollar + @two_francs
    end.should raise_error(InvalidMoneyAddition)
  end
end
