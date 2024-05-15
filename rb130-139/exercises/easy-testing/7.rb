# `#assert_instance_of(cls, obj, msg = nil)`
  # Fails unless `obj` is an instance of `cls`
  # `#assert_instance_of` uses `Object#instance_of?` to ensure that its second argument is an instance of the class named as its first argument.

# ----- Solution
# assert_instance_of(Numeric, value)

# ----- Implemented Solution
require 'minitest/autorun'

class TestExercise7 < Minitest::Test
  def test_1 # pass
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

  def test_2 # fail
    value = String.new
    assert_instance_of(Numeric, value)
  end
end

# ----- Further Exploration
# The question tries to guide us to use `#assert_instance_of` instead of `#assert_kind_of` when it says that `value` may not be an instance of one of `Numeric`'s superclasses. 
# `Object#kind_of?(class) -> true or false`
  # This method returns true if `class` is the class of `obj` or if the class is one of the superclasses of or modules included in `obj`.