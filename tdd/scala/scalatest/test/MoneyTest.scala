import org.scalatest.FlatSpec
import org.scalatest.matchers.ShouldMatchers
import org.mockito.Mockito._
import lib._

package test {

class MoneyTest extends FlatSpec with ShouldMatchers {
    val one_dollar = new lib.Money(1, 'dollar)
    val two_francs = new lib.Money(2, 'franc)

    it should "be able to add dollars to dollars" in {
        (one_dollar + one_dollar) should be === (new Money(2, 'dollar))
        (one_dollar + one_dollar) should be <  (new Money(3, 'dollar))
        (one_dollar + one_dollar) should be <= (new Money(2, 'dollar))
    }

    it should "be able to subtract dollars to dollars" in {
        (new Money(2, 'dollar) - one_dollar) should be === (new Money(1, 'dollar))
    }

    it should "be unable to compare dollars and francs" in {
        one_dollar should not be === (two_francs)
        one_dollar should not be >  (two_francs)
        one_dollar should not be >= (two_francs)
        one_dollar should not be <  (two_francs)
        one_dollar should not be <= (two_francs)
    }

    it should "be unable to add dolars and francs" in {
        evaluating { one_dollar + two_francs } should produce [InvalidMoneyOperation]
    }

    it should "be unable to subtract dolars and francs" in {
        evaluating { one_dollar - two_francs } should produce [InvalidMoneyOperation]
    }

    it should "be able to apply the money on a bank" in {
        val bank = mock(classOf[Bank])
        one_dollar apply_on bank
        verify(bank) apply one_dollar
    }

}

}
