require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../food")

class FoodTest < MiniTest::Test

  def setup
    @Curry_Chips  = Food.new("Curry Chips", 2, 4)
    @Steak_Pie    = Food.new("Steak Pie", 4, 6)
    @Dirty_Burger = Food.new("Dirty Burger", 5, 5)
    @Vegan_Burger = Food.new("Vegan Burger", 5, 2)
  end

  def test_food_name
    assert_equal("Steak Pie", @Steak_Pie.food_name)
  end

  def test_food_price
    assert_equal(2, @Curry_Chips.food_price)
  end

  def test_food_rejuvenation_level
    assert_equal(5, @Dirty_Burger.rejuvenation_level)
  end
end
