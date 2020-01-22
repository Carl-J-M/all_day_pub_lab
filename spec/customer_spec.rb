require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')


class TestCustomer < Minitest::Test

  def setup
    @customer = Customer.new("Bill", 100, 21)
    @drinks1 = Drink.new("Pint", 5, 5)
    @drinks2 = Drink.new("Gin and Tonic", 6, 5)
    @drinks3 = Drink.new("Espresso Martini", 8, 6)
    @pub = Pub.new("Shakespeares", [@drinks1, @drinks2, @drinks3])

  end

  def test_customer_has_name()
    assert_equal("Bill", @customer.name)
  end

  def test_customer_has_age()
    assert_equal(21, @customer.age)
  end

  def test_customer_has_money()
    assert_equal(100, @customer.get_money_total)
  end

  def test_reduce_customer_money()
    @customer.reduce_customer_money(20)
    assert_equal(80, @customer.get_money_total)
  end

  def test_customer_has_drinks()
    assert_equal(0, @customer.get_drinks)
  end

  def test_add_drink_to_customer()
    drink = @pub.remove_drink_from_stock("Pint") #Removes drink object from pub stock array
    @customer.add_drink_to_customer(drink) #Pushes drink objecy from pub into @customer.drinks_bought
    assert_equal(1, @customer.get_drinks)
  end


  def test_buy_drink()
    @customer.buy_drink(@pub.remove_drink_from_stock("Pint"), @pub)
    @customer.buy_drink(@pub.remove_drink_from_stock("Gin and Tonic"), @pub)
    @customer.buy_drink(@pub.remove_drink_from_stock("Espresso Martini"), @pub)
    assert_equal(89, @customer.get_money_total)
    assert_equal(2, @customer.get_drinks)
    assert_equal(11, @pub.get_till_total)
    assert_equal(0, @pub.stock_check)
  end


  def test_drunk_level()
    @customer.buy_drink(@pub.remove_drink_from_stock("Pint"), @pub)
    assert_equal(5, @customer.get_drunk_level())
  end










end
