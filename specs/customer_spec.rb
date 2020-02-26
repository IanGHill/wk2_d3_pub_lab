require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")

class CustomerTest < MiniTest::Test

  def setup

    @Ian = Customer.new("Ian", 50, 45, 0)
    @Jamie = Customer.new("Jamie", 30, 24, 0)

  end

  def test_get_customer_name
    assert_equal("Ian", @Ian.customer_name)
  end

  def test_get_wallet_value
    assert_equal(30, @Jamie.wallet)
  end

  def test_reduce_wallet
    @Ian.reduce_wallet(4)
    assert_equal(46, @Ian.wallet)
  end
end
