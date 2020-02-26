require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub")
require_relative("../drink")
require_relative("../customer")
require_relative("../food")


class PubTest < MiniTest::Test

  def setup

    @Guinness = Drink.new("Guinness", 4, 4, 109)
    @Gordons = Drink.new("Gordons", 3, 5, 24)
    @Tennants = Drink.new("Tennants", 4, 4, 111)

    @drinks = [@Guinness, @Gordons, @Tennants]

    @Chanter = Pub.new("Chanter", 100, @drinks)

    @Curry_Chips  = Food.new("Curry Chips", 2, 4)
    @Steak_Pie    = Food.new("Steak Pie", 4, 6)
    @Dirty_Burger = Food.new("Dirty Burger", 5, 5)
    @Vegan_Burger = Food.new("Vegan Burger", 5, 2)

    @Ian = Customer.new("Ian", 50, 45, 0)
    @Jamie = Customer.new("Jamie", 30, 24, 0)
    @Tom = Customer.new("Tom", 20, 17, 0)
    @Boaab = Customer.new("Boaab", 20, 19, 78)

  end

  def test_get_pub_name
    assert_equal("Chanter", @Chanter.pub_name)
  end

  def test_get_till_value
    assert_equal(100, @Chanter.till)
  end

  def test_increase_till
    @Chanter.increase_till(4)
    assert_equal(104, @Chanter.till)
  end

  def test_customer_buys_drink
    @Chanter.customer_buys_drink(@Ian, @Guinness)
    assert_equal(104, @Chanter.till)
    assert_equal(46, @Ian.wallet)
    assert_equal(108, @Guinness.stock_level)
  end

  def test_customer_buys_drink__below_age
    @Chanter.customer_buys_drink(@Tom, @Guinness)
    assert_equal(100, @Chanter.till)
    assert_equal(20, @Tom.wallet)
  end

  def test_get_cellar_count
    assert_equal(3, @Chanter.cellar.count)
  end

  def test_check_age
    assert_equal(24, @Jamie.age)
  end

  def test_increase_drunkenness
    @Chanter.customer_buys_drink(@Ian, @Guinness)
    assert_equal(4, @Ian.drunkenness)
  end

  def test_increase_drunkenness_refusal
    @Chanter.customer_buys_drink(@Boaab, @Guinness)
    assert_equal(100, @Chanter.till)
    assert_equal(20, @Boaab.wallet)
  end

  def test_customer_buys_food
    @Chanter.customer_buys_food(@Boaab, @Steak_Pie)
    assert_equal(104, @Chanter.till)
    assert_equal(16, @Boaab.wallet)
    assert_equal(72, @Boaab.drunkenness)
  end

  def test_stock_value
    assert_equal(952, @Chanter.stock_value)
  end

end
