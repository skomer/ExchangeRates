require 'pry-byebug'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../models/rate_record.rb'

class TestRateRecord < MiniTest::Test

  def setup
    options = {
      'rate_date' => "2009-10-04",
      'currency' => "DKK",
      'rate' => 6.8922
    }
    @rate_record = RateRecord.new(options)
  end

  def test_rate_record_has_currency
    assert_equal("DKK", @rate_record.currency)
  end

  def test_can_retrieve_record_by_id
    test_rate = RateRecord.new({
      'rate_date' => Time.now,
      'currency' => "AAA",
      'rate' => 9.999
    })
    test_rate.save
    retrieve_rate = RateRecord.rate_record(test_rate.id)
    assert_equal(9.999, retrieve_rate.rate)
  end

  def test_database_does_not_accept_duplicates
    duplicate_rate_1 = RateRecord.new({
      'rate_date' => "1999-12-31",
      'currency' => "BBB",
      'rate' => 0.001
    })
    duplicate_rate_2 = Rate_Record.new({
      'rate_date' => "1999-12-31",
      'currency' => "BBB",
      'rate' => 0.001
    })
    duplicate_rate_1.save
    actual = duplicate_rate_2.save
    assert_equal("Error: duplicate record not saved", actual)
  end

  def test_can_retrieve_record_by_rate_date_and_currency
    time = Time.now
    test_rate = RateRecord.new({
      'rate_date' => time,
      'currency' => "CCC",
      'rate' => 1.111
    })
    test_rate.save
    retrieve_rate = RateRecord.rate_record_by_date_and_currency(test_rate.rate_date, test_rate.currency)
    assert_equal(test_rate.rate_date.to_s, retrieve_rate.rate_date)
  end




end
