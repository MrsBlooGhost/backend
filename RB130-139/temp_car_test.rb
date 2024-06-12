require 'minitest/autorun'

require_relative 'car'

class CarTest < Minitest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    car = Car.new
    assert_equal(3, car.wheels)
  end

  def test_bad_wheels_2
    skip
    car = Car.new
    assert_equal(1, car.wheels)
  end
end