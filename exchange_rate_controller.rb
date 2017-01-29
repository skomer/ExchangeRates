require_relative './models/feed.rb'
require_relative './models/rate_record.rb'
require 'pry-byebug'


# new
get '/exchange_rate/new' do
  @currencies = RateRecord.get_currencies
  erb(:'new')
end