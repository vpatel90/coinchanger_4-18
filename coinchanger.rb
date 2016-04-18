require "minitest/test"
require "minitest/autorun"


class CoinChanger
  attr_accessor :coins
  def initialize(n)
    value = [25,10,5,1]
    @coins = []
    @remaining = n
    value.each do |val|
      add_coins(val)
    end
    # add_quarters
    # add_dimes
    # add_nickles
    # add_pennies
  end

  def add_coins(n)
    (@remaining/n).times do
      @coins << n
      @remaining -= n
    end
  end

  # def add_quarters
  #   (@remaining/25).times do
  #     @coins << 25
  #     @remaining -= 25
  #   end
  # end
  #
  # def add_dimes
  #   (@remaining/10).times do
  #     @coins << 10
  #     @remaining -= 10
  #   end
  # end
  #
  # def add_nickles
  #   (@remaining/5).times do
  #     @coins << 5
  #     @remaining -= 5
  #   end
  # end
  # def add_pennies
  #   @remaining.times do
  #     @coins << 1
  #     @remaining -= 1
  #   end
  # end

end

class TestCoinChanger < MiniTest::Test
  def test_cc_exists
    assert CoinChanger.new(1)
  end

  def test_cc_coins_returns_array
    assert_equal(Array, CoinChanger.new(1).coins.class)
  end

  def test_cc_coins_returns_penny
    cc = CoinChanger.new(1)
    assert_equal([1], cc.coins)
  end

  def test_cc_coins_returns_nickle
    cc = CoinChanger.new(5)
    assert_equal([5], cc.coins)
  end

  def test_cc_coins_returns_dime
    cc = CoinChanger.new(10)
    assert_equal([10], cc.coins)
  end

  def test_cc_coins_returns_quarter
    cc = CoinChanger.new(25)
    assert_equal([25], cc.coins)
  end

  def test_cc_coins_returns_change
    cc = CoinChanger.new(7)
    assert_equal([5,1,1], cc.coins)
  end
end
