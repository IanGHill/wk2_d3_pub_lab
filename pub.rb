class Pub

attr_reader :pub_name, :till, :cellar

  def initialize(pub_name, till, cellar )
    @pub_name = pub_name
    @till     = till
    @cellar    = cellar
  end

  def increase_till(amount)
    @till += amount
  end

  def customer_buys_drink(customer, drink)
    if customer.age >= 18
        if customer.drunkenness <= 20
          increase_till(drink.price)
          customer.reduce_wallet(drink.price)
          customer.drunkenness += drink.alcohol_level
        else
        end
    else
    end
  end

  def customer_buys_food(customer, food)
    increase_till(food.food_price)
    customer.reduce_wallet(food.food_price)
    customer.drunkenness -= food.rejuvenation_level  
  end
end
