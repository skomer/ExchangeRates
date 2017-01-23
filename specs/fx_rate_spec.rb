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

  def test_can_save_to_db_and_retrieve_single_record
    test_rate = FxRate.new({
      'rate_date' => "2017-01-23",
      'currency' => "999",
      'rate' => 9.999
    })
    test_rate.save
    retrieve_rate = FxRate.fx_rate(test_rate.id)
    assert_equal(9.999, retrieve_rate.rate)
  end





end
