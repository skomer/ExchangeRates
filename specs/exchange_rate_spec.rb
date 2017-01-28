require 'pry-byebug'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../models/exchange_rate.rb'
# require_relative '../models/feed.rb'
# require_relative '../models/rate_record.rb'

class TestExchangeRate < MiniTest::Test

  def test_exchange_rate_can_fetch_rate_from_db
    rate_against_euro = ExchangeRate.at("2016-11-17", "GBP", "MXN")
    assert_equal(0.86055, rate_against_euro)
  end

  def test_exchange_rate_can_calculate_conversion
    options = {
      "hkd_amount" => 100.00,
      "from_currency" => "HKD",
      "to_currency" => "USD",
      "date_requested" => "2016-12-28"
    }
    converted_amount = ExchangeRate.convert(options)
    assert_equal(12.8894, converted_amount)
  end


end


