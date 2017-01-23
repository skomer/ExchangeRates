require 'pry-byebug'
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

  def test_can_save_and_retrieve_record_by_id
    test_rate = FxRate.new({
      'rate_date' => Time.now,
      'currency' => "AAA",
      'rate' => 9.999
    })
    test_rate.save
    retrieve_rate = FxRate.fx_rate(test_rate.id)
    assert_equal(9.999, retrieve_rate.rate)
  end

  def test_database_does_not_accept_duplicates
    duplicate_rate_1 = FxRate.new({
      'rate_date' => "1999-12-31",
      'currency' => "BBB",
      'rate' => 0.001
    })
    duplicate_rate_2 = FxRate.new({
      'rate_date' => "1999-12-31",
      'currency' => "BBB",
      'rate' => 0.001
    })
    duplicate_rate_1.save
    actual = duplicate_rate_2.save
    assert_equal("Error: duplicate record not saved", actual)
  end

  def test_can_retrieve_record_by_rate_date
    test_rate = FxRate.new({
      'rate_date' => "2015-09-17",
      'currency' => "CCC",
      'rate' => 1.111
    })
    test_rate.save
    retrieve_rate = FxRate.fx_rate_by_date(test_rate.rate_date)
    assert_equal(test_rate.rate_date, retrieve_rate.rate)
  end




end
