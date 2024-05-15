# `#assert_kind_of(cls, obj, msg = nil)`
  # Fails unless `obj` is a kind of `cls`
  # `#assert_kind_of` uses `Object#kind_of?` to check if the class of its second argument is an instance of the named class or one of the named class's subclasses. 

# ----- Solution
# assert_kind_of(Numeric, value)

# ----- Implemented Solution
require 'minitest/autorun'

class TestExercise8 < Minitest::Test
  def test_1 # pass
    value = 9.0
    assert_kind_of(Numeric, value)
  end

  def test_2 # fail
    value = 'a'
    assert_kind_of(Numeric, value)
  end
end