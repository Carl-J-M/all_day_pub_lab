class Pub

  attr_reader(:name)

  def initialize(name, stock)
    @name = name
    @till = 0
    @stock = stock
  end


def stock_check()
  return @stock.count
end


def get_till_total()
  return @till
end

def remove_drink_from_stock(name)
  for drink in @stock
    if name == drink.name
      @stock.delete(drink)
      return drink
    end
  end
end

def add_money_to_till(amount)
  @till += amount
end


def check_id(age_to_check)
  if age_to_check >= 18
    return true
  end
  if age_to_check <= 17
    return false
  end
end





end
