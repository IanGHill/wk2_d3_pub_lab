class Customer

attr_reader :customer_name, :age
attr_accessor :wallet, :drunkenness

  def initialize(customer_name, wallet, age, drunkenness)
  @customer_name = customer_name
  @wallet        = wallet
  @age           = age
  @drunkenness   = drunkenness
  end

  def reduce_wallet(amount)
  @wallet -= amount
  end

end
