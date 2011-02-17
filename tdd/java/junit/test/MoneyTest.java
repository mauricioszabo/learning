package test;

import org.junit.*;
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
        assertTrue((oneDollar.add(oneDollar)).lt(new Money(3, "dollar")));
        assertTrue((oneDollar.add(oneDollar)).lte(new Money(2, "dollar")));
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
}
