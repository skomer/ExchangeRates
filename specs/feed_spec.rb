require 'pry-byebug'
require 'minitest/autorun'
require 'minitest/pride'
require 'Nokogiri'
require_relative '../models/feed.rb'
# require_relative '../models/fx_rate.rb'

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

  def test_can_send_data_to_fx_rates_object
    @feed.construct_and_save_fx_rates_objects
    fx_rate = FxRate.fx_rate_by_date("2016-12-27")
    assert_equal(21.5344, fx_rate.rate)
  end


end




