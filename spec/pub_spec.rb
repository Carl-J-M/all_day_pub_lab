require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')


class TestPub < Minitest::Test

def setup
  @drinks1 = Drink.new("Pint", 5, 2)
  @drinks2 = Drink.new("Gin and Tonic", 6, 3)
  @drinks3 = Drink.new("Espresso Martini", 8, 5)
  @pub = Pub.new("Shakespeares", [@drinks1, @drinks2, @drinks3])
  @customer = Customer.new("Bill", 100, 21)

end


def test_pub_name
  assert_equal("Shakespeares", @pub.name)
end


def test_pub_stock
  assert_equal(3, @pub.stock_check)
end


def test_pub_till
  assert_equal(0, @pub.get_till_total)
end


def test_remove_drink_from_stock
  @pub.remove_drink_from_stock("Pint")
  assert_equal(2, @pub.stock_check)
end

def test_add_money_to_till()
  @pub.add_money_to_till(5)
  assert_equal(5, @pub.get_till_total())
end

def test_check_id()
  can_drink = @pub.check_id(@customer.get_age)
  assert_equal(true, can_drink)
end







end
