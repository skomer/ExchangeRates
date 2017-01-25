require 'pry-byebug'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../models/exchange_rate.rb'
# require_relative '../models/feed.rb'
# require_relative '../models/rate_record.rb'

class TestExchangeRate < MiniTest::Test

  def setup
    options = {
      'date_requested' => "2015-09-17",
      'from_currency' => "GBP",
      'to_currency' => "MXN"
    }
    @exchange_rate = ExchangeRate.new(options)
  end

  def test_exchange_rate_has_date_requested
    assert_equal("2015-09-17", @exchange_rate.date_requested)
  end




end