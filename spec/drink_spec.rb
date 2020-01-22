require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../pub.rb')
require_relative('../drink.rb')


class TestDrink < Minitest::Test

def setup
  @drinks1 = Drink.new("Pint", 5, 2)
end

def test_drink_has_name
  assert_equal("Pint", @drinks1.name)
end


def test_drink_has_price
  assert_equal(5, @drinks1.price)
end

def test_get_drink_strength()
  assert_equal(2, @drinks1.strength)
end







end
