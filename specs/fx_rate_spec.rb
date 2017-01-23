require 'minitest/autorun'
require 'minitest/pride'
require_relative '../models/fx_rate.rb'

class TestFxRate < MiniTest::Test

  def setup
    options = {
      'rate_date' => "2009-10-04",
      'currency' => "DKK",
      'rate' => 6.8922
    }
    @fx_rate = FxRate.new(options)
  end

  def test_fx_rate_has_currency
    assert_equal("DKK", @fx_rate.currency)
  end





end
