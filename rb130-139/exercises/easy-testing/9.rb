# `#assert_same(exp, act, msg = nil)`
  # Fails unless `exp` and `act` are equal?
  # `#assert_same` tests whether its first and second arguments are the same object, as determined by `#equal?`.

# ----- Solution
# assert_same(list, list.process)

# ----- Implemented Solution (???)
require 'minitest/autorun'

class TestExercise9 < Minitest::Test
  class List
    def process
      'process'
    end
  end

  def test_2 # fail
    list = List.new
    list = 'run through list'
    assert_same(list, list.process)
  end
end