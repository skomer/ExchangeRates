require 'pry-byebug'
require 'minitest/autorun'
require 'minitest/pride'
require 'Nokogiri'
require_relative '../models/feed.rb'
# require_relative '../models/fx_rate.rb'

class TestFxRate < MiniTest::Test

  def setup
    source = "http://fakesource.lum"
    @feed = Feed.new(source)
  end

  def test_feed_has_source
    assert_equal("http://fakesource.lum", @feed.source)
  end

  def test_feed_fetches_rates_xml
    date_today = Time.now.to_s[0..9]
    feed = Feed.new("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml")
    doc = feed.get_data
    feed_date_today = doc.xpath('//xmlns:Cube')[0].elements[0].attribute('time')
    assert_equal(date_today, feed_date_today)
  end


end





