# `refuse_includes(collection, obj, msg = nil)`
  # Most minitest assertions have a corresponding refustation method that fails if the indicated condition is true. 

# ----- Solution
# refute_includes(list, 'xyz')

# ----- Implemented Solution
require 'minitest/autorun'

class TestExercise10 < Minitest::Test
  def test_1 # pass
    list = ['abc', 123]
    refute_includes(list, 'xyz')
  end

  def test_2 # fail
    list = ['xyz', 123]
    refute_includes(list, 'xyz')
  end
end