require 'pry-byebug'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../models/feed.rb'
# require_relative '../models/fx_rate.rb'

class TestFxRate < MiniTest::Test

  def setup
    options = {
      'source' => "http://fakesource.lum"
    }
    @feed = Feed.new(options)
  end

  def test_feed_has_source
    assert_equal("http://fakesource.lum", @feed.source)
  end



end