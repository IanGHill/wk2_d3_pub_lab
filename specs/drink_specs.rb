require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../drink")

class DrinkTest < MiniTest::Test

  def setup
    @Guinness = Drink.new("Guinness", 4, 4, 109)
    @Gordons = Drink.new("Gordons", 3, 5, 24)
    @Tennants = Drink.new("Tennants", 4, 4, 111)

    @drinks = [@Guinness, @Gordons, @Tennants]

=begin
@stock = { @cellar = [@Guinness, @Gordons, @Tennants]
          quanrirty :80
        }


=end



  end

  def test_get_drink__name
    assert_equal("Guinness", @Guinness.drink_name)
  end

  def test_get_drink_price
    assert_equal(3, @Gordons.price)
  end

  def test_get_stock_level
    assert_equal(111, @Tennants.stock_level)
  end
end
