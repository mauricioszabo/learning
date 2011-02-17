package test;

import org.junit.*;
import org.hamcrest.*;
import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;
import lib.*;
import static org.mockito.Mockito.*;

public class MoneyTest {
    private Money oneDollar;
    private Money twoFrancs;

    @Before public void setUp() {
        oneDollar = new Money(1, "dollar");
        twoFrancs = new Money(2, "franc");
    }

    @Test public void addDollarsToDollars() throws InvalidMoneyOperation {
        assertThat(oneDollar.add(oneDollar), is(new Money(2, "dollar")));
        assertTrue(oneDollar.add(oneDollar).lt(new Money(3, "dollar")));
        assertTrue(oneDollar.add(oneDollar).lte(new Money(2, "dollar")));
    }

    @Test public void subtractDollarsToDollars() throws InvalidMoneyOperation {
        assertThat(new Money(2, "dollar").sub(oneDollar), is(new Money(1, "dollar")));
    }

    @Test public void cantCompareDollarsAndFrancs() {
        assertThat(oneDollar, is(not(twoFrancs)));
        assertFalse(oneDollar.gt(twoFrancs));
        assertFalse(oneDollar.gte(twoFrancs));
        assertFalse(oneDollar.lt(twoFrancs));
        assertFalse(oneDollar.lte(twoFrancs));
    }

    @Test(expected=InvalidMoneyOperation.class) public void cantAddDollarsAndFrancs() throws InvalidMoneyOperation {
        oneDollar.add(twoFrancs);
    }

    @Test(expected=InvalidMoneyOperation.class) public void cantSubtractDollarsAndFrancs() throws InvalidMoneyOperation {
        oneDollar.sub(twoFrancs);
    }

    @Test public void canApplyTheMoneyOnABank() {
        Bank bank = mock(Bank.class);
        oneDollar.applyOn(bank);
        verify(bank).apply(oneDollar);
    }
    
    @Test public void greaterThan20000ShouldBeExpensive() {
        Money thousandBucks = new Money(30000, "dollar");
        assertThat(thousandBucks, isExpensive());
    }

    private Matcher<Money> isExpensive() {
        return new BeExpensive<Money>();
    }

    @Test public void identifyTheCurrencyOfTheMoney() {
        assertThat(twoFrancs, haveCurrency("franc"));
    }

    private Matcher<Money> haveCurrency(String curr) {
        return new HaveCurrency<Money>(curr);
    }

    class BeExpensive<T> extends BaseMatcher<T> {
        public boolean matches(Object item) {
            Money money = (Money) item;
            return money.getValue() > 20000;
        }
        
        public void describeTo(Description d) { d.appendText("to be expensive"); }
    }

    class HaveCurrency<T> extends BaseMatcher<T> {
        private String currency;

        public HaveCurrency(String c) { currency = c; }
        public void describeTo(Description d) { d.appendText("to be of currency " + currency); }
        
        public boolean matches(Object item) {
            Money money = (Money) item;
            return money.getName().equals(currency);
        }
    }
}
