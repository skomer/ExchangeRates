require 'pry-byebug'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../models/exchange_rate.rb'
# require_relative '../models/feed.rb'
# require_relative '../models/rate_record.rb'

class TestExchangeRate < MiniTest::Test

  def test_exchange_rate_can_fetch_rate_from_db
    gbp_rate_against_euro = ExchangeRate.get_rate("2016-11-17", "GBP", "MXN")[0]
    mxn_rate_against_euro = ExchangeRate.get_rate("2016-11-17", "GBP", "MXN")[1]
    assert_equal(0.86055, gbp_rate_against_euro)
    assert_equal(21.7504, mxn_rate_against_euro)

  end

  def test_exchange_rate_can_calculate_from_to_currency_rate
    gbp_rate_against_euro = ExchangeRate.get_rate("2016-11-17", "GBP", "MXN")[0]
    mxn_rate_against_euro = ExchangeRate.get_rate("2016-11-17", "GBP", "MXN")[1]
    gbp_to_mxn_rate = ExchangeRate.calculate_from_to_currency_rate(gbp_rate_against_euro, mxn_rate_against_euro)
    assert_equal(25.2750, gbp_to_mxn_rate)
  end



  # def test_exchange_rate_can_calculate_conversion
  #   options = {
  #     "amount_to_convert" => 100.00,
  #     "from_currency" => "HKD",
  #     "to_currency" => "USD",
  #     "date_requested" => "2016-12-28"
  #   }
  #   converted_amount = ExchangeRate.convert(options)
  #   assert_equal(12.8894, converted_amount)
  # end


end


