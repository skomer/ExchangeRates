require_relative './models/feed.rb'
require_relative './models/rate_record.rb'
require 'pry-byebug'


# create
post '/feed' do
  @feed = Feed.new("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml")
  @feed.construct_and_save_rate_records()
  redirect '/exchange_rate/new'
end
