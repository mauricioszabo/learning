import org.scalatest.FlatSpec
import org.scalatest.matchers.ShouldMatchers
import org.scalatest.matchers.MatchResult
import org.scalatest.matchers.Matcher
import org.scalatest.matchers.BeMatcher
import org.mockito.Mockito._
import lib._

package test {

class MoneyTest extends FlatSpec with ShouldMatchers {
    val oneDollar = new lib.Money(1, 'dollar)
    val twoFrancs = new lib.Money(2, 'franc)

    it should "be able to add dollars to dollars" in {
        (oneDollar + oneDollar) should be === (new Money(2, 'dollar))
        (oneDollar + oneDollar) should be <  (new Money(3, 'dollar))
        (oneDollar + oneDollar) should be <= (new Money(2, 'dollar))
    }

    it should "be able to subtract dollars to dollars" in {
        (new Money(2, 'dollar) - oneDollar) should be === (new Money(1, 'dollar))
    }

    it should "be unable to compare dollars and francs" in {
        oneDollar should not be === (twoFrancs)
        oneDollar should not be >  (twoFrancs)
        oneDollar should not be >= (twoFrancs)
        oneDollar should not be <  (twoFrancs)
        oneDollar should not be <= (twoFrancs)
    }

    it should "be unable to add dolars and francs" in {
        evaluating { oneDollar + twoFrancs } should produce [InvalidMoneyOperation]
    }

    it should "be unable to subtract dolars and francs" in {
        evaluating { oneDollar - twoFrancs } should produce [InvalidMoneyOperation]
    }

    it should "be able to apply the money on a bank" in {
        val bank = mock(classOf[Bank])
        oneDollar apply_on bank
        verify(bank) apply oneDollar
    }

    it should "be expensive if greater than 20,000" in {
        val thousand_bucks = new Money(30000, 'dollar)
        thousand_bucks should be (expensive)
    }

    it should "identify the currency of the money" in {
        twoFrancs should haveCurrency ('franc)
    }

    def expensive = new BeExpensiveMatcher()
    class BeExpensiveMatcher extends BeMatcher[Money] {
        def apply(money: Money) = MatchResult(
            money.value > 20000,
            money + " is not expensive",
            money + " is expensive"
        )
    }

    def haveCurrency(name: Symbol) = new HaveCurrencyMatcher(name)
    class HaveCurrencyMatcher(name: Symbol) extends Matcher[Money] {
        def apply(money: Money) = MatchResult(
            money.name == name,
            "Expected money to be of currency " + name,
            "Expected money to not be of currency " + name
        )
    }
}

}
