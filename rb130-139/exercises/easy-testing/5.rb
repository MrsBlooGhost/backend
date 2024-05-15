# `assert_includes(collection, obj, msg = nil)`
  # Fails unless `collection` includes `obj`.
  # `#assert_includes` tests whether its first argument contains the second argument.
# You can use `#assert_equal(true, list.include?('xyz')), but the below solution is clearer and issues a better failure message.

# ----- Solution
# assert_includes(list, 'xyz')

# ----- Implemented Solution
require 'minitest/autorun'

class TestExercise5 < Minitest::Test
  def test_1 # pass
    list = ['abc', 'xyz']
    assert_includes(list, 'xyz')
  end

  def test_2 # fail
    list = ['abc']
    assert_includes(list, 'xyz')
  end
end