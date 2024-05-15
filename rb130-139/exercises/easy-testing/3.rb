# `assert_nil(obj, msg = nil)`
  # `assert_nil` fils unless `obj` is nil.

# ----- Solution
# assert_nil(value)

# ----- Implemented Solution
require 'minitest/autorun'

class TestExercise3 < Minitest::Test
  def test_1 # pass
    value = nil
    assert_nil(value)
  end

  def test_2 # fail
    value = 1
    assert_nil(value)
  end
end