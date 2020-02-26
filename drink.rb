class Drink

attr_reader :drink_name, :price, :alcohol_level
attr_accessor :stock_level
  def initialize(drink_name, price, alcohol_level, stock_level)
    @drink_name    = drink_name
    @price         = price
    @alcohol_level = alcohol_level
    @stock_level   = stock_level
  end

end
