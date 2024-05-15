# `#assert_empty(obj, msg = nil)`
  # `#assert_empty` fails unless `obj` is empty.
  # `#assert_empty` tests whether its first argument responds to the method `#empty?` with a `true` value.
# You can use `assert_equal(true, list.empty?)`, but the below solution is clearer and issues a better failure message.

# ----- Solution
assert_empty(list)

# ----- Implemented Solution
require 'minitest/autorun'

class TestExercise4 < Minitest::Test
  def test_1 # pass
    list = []
    assert_empty(list)
  end

  def test_2 # fail
    list = ['a']
    assert_empty(list)
  end
end