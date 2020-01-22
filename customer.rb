class Customer

  attr_reader(:name, :age)

  def initialize(name, funds, age)
    @name = name
    @wallet = funds
    @age = age
    @drinks_bought = []
  end

  def get_age
    return @age
  end

  def get_money_total
    return @wallet
  end

  def reduce_customer_money(amount)
    @wallet -= amount
  end

  def get_drinks()
    return @drinks_bought.count
  end

  def add_drink_to_customer(drink_to_add)
      @drinks_bought.push(drink_to_add)
  end

  def get_drunk_level
    total_drunkness = 0
    for drink in @drinks_bought
      total_drunkness += drink.strength
    end
    return total_drunkness
  end


  def buy_drink(drink, pub)
      if get_drunk_level >= 10
      else
    add_drink_to_customer(drink)
    reduce_customer_money(drink.price)
    pub.add_money_to_till(drink.price)
  end
end



end
