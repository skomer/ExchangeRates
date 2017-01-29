require 'pry-byebug'
require 'minitest/autorun'
require 'minitest/pride'
require 'Nokogiri'
require_relative '../models/feed.rb'
require_relative '../models/rate_record.rb'

class TestFeed < MiniTest::Test

  def setup
    fake_source = "http://fakesource.lum"
    @fake_feed = Feed.new(fake_source)
    source = "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"
    @feed = Feed.new(source)
    @date_today = Time.now.to_s[0..9]
  end

  def test_feed_has_source
    assert_equal("http://fakesource.lum", @fake_feed.source)
  end

  def test_feed_fetches_rates_xml
    doc = @feed.get_data
    first_currency = doc.xpath('//xmlns:Cube')[0].elements[0].elements[0].attributes["currency"].value
    assert_equal("USD", first_currency)
  end

  def test_feed_parses_xml
    rates_by_date = @feed.parse_xml
    assert_equal(1.0715, rates_by_date["2017-01-23"]["USD"].to_f)
  end

  def test_can_send_data_to_rate_records
    @feed.construct_and_save_rate_records
    rate_record = RateRecord.rate_record_by_date_and_currency("2016-12-27", "MXN")
    assert_equal(21.5344, rate_record.rate)
  end

  def test_euro_rate_is_saved
    @feed.construct_and_save_rate_records
    euro_rate = RateRecord.rate_record_by_date_and_currency("2017-01-05", "EUR")
    assert_equal(1.000, euro_rate.rate)
  end


end












