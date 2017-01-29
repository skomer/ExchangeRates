require_relative './models/feed.rb'
require_relative './models/rate_record.rb'
require 'pry-byebug'


# new
get '/exchange_rate/new' do
  @currencies = RateRecord.get_currencies
  erb(:'new')
end

# create
post '/exchange_rates' do
  @exchange_rate = ExchangeRate.at(params["date_requested"], params["from_currency"], params["to_currency"])
  erb(:'create')
end