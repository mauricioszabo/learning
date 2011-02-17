package lib;

public class Money {
    private int value;
    private String name;

    public int getValue() { return value; }
    public String getName() { return name; }

    public Money(int value, String name) {
        this.name = name;
        this.value = value;
    }

    public Money add(Money other) throws InvalidMoneyOperation {
        if(isOtherMoney(other)) throw new InvalidMoneyOperation();
        return new Money(value + other.getValue(), "dollar");
    }

    public Money sub(Money other) throws InvalidMoneyOperation {
        if(isOtherMoney(other)) throw new InvalidMoneyOperation();
        return new Money(value - other.getValue(), "dollar");
    }

    public boolean equals(Object other) {
        try {
            if(other.getClass() != Class.forName("lib.Money")) return false;
        } catch(Exception e) {
            return false;
        }

        Money m = (Money) other;
        if(isOtherMoney(m)) return false;
        return value == m.getValue();
    }

    public boolean lt(Money other) {
        if(isOtherMoney(other)) return false;
        return value < other.getValue();
    }

    public boolean lte(Money other) {
        if(isOtherMoney(other)) return false;
        return value <= other.getValue();
    }

    public boolean gt(Money other) {
        if(isOtherMoney(other)) return false;
        return value > other.getValue();
    }

    public boolean gte(Money other) {
        if(isOtherMoney(other)) return false;
        return value >= other.getValue();
    }

    private boolean isOtherMoney(Money other) {
        return name != other.getName();
    }

    public void applyOn(Bank bank) {
        bank.apply(this);
    }

    public String toString() {
        return "$: " + value + " " + name;
    }
}
