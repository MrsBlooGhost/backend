# `assert_raises(*exp) { || ... }`
  # Fails unless the block raises one of the `exp`
  # Returns the exception matched, so you can check the message, attributes, etc.
  # `#assert_raises` checks if the given block raises an exception of the named type. If it doesn't, the assertion fails. 

# ----- Solution
# assert_raises(NoExperienceError) { employee.hire }

# ----- Implemented Solution
# It is bad practice to subclass from `Exception` for custom errors. We should instead subclass from `StandardError`.

require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError, 'Got no experience'
  end
end

class TestExercise6 < Minitest::Test
  def test_1 # pass
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end