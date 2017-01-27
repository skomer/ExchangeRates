require 'pry-byebug'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../models/exchange_rate.rb'
# require_relative '../models/feed.rb'
# require_relative '../models/rate_record.rb'

class TestExchangeRate < MiniTest::Test

  def setup
    date_requested = "2016-11-17"
    from_currency = "GBP"
    to_currency = "MXN"
    @exchange_rate = ExchangeRate.new(date_requested, from_currency, to_currency)
  end

  def test_exchange_rate_has_date_requested
    assert_equal("2016-11-17", @exchange_rate.date_requested)
  end

  def test_exchange_rate_can_fetch_rate_from_db
    rate_against_euro = @exchange_rate.at(@exchange_rate.date_requested, @exchange_rate.from_currency, @exchange_rate.to_currency);
    assert_equal(0.86055, rate_against_euro)
  end



end


