class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Ben is correct. An `@` isn't needed in front of `balance` in the `positive_balance?`
# method, as `balance` here is the getter method `balance`. We can use `self.balance`
# here to explicitly refer to the getter method `balance`. It is standard
# practice to use the getter method rather than the instance variable, if it is
# available. 