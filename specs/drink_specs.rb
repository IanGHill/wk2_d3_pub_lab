require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../drink")

class DrinkTest < MiniTest::Test

  def setup
    @Guinness = Drink.new("Guinness", 4, 4)
    @Gordons = Drink.new("Gordons", 3, 5)
    @Tennants = Drink.new("Tennants", 4, 4)

    @drinks = [@Guinness, @Gordons, @Tennants]
  end

  def test_get_drink__name
    assert_equal("Guinness", @Guinness.drink_name)
  end

  def test_get_drink_price
    assert_equal(3, @Gordons.price)
  end
end
