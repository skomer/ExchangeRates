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

  


end


