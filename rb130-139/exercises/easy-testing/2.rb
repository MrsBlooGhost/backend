# `assert_equal(exp, act, msg = nil)`
  # `#assert_equal` tests whether its first two arguments are equal using `#==`. The first argument represents the expected value and the second argument represents the actual value to be tested. 

# ----- Solution
# assert_equal(exp, act, msg = nil)
# assert_equal('xyz', value.downcase)

# ----- Implemented Solution
require 'minitest/autorun'

class TestExercise2 < Minitest::Test
  def test_1 # pass
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end

  def test_2 # fail
    value = 'XYZa'
    assert_equal('xyz', value.downcase)
  end
end