require_relative './models/rate_record.rb'
require_relative './models/exchange_rate.rb'


# new
get '/exchange_rate/new' do
  @currencies = RateRecord.get_currencies
  erb(:'new')
end

# create
post '/exchange_rates' do
  @date_requested = params["date_requested"]
  @from_currency = params["from_currency"]
  @to_currency = params["to_currency"]
  @amount = params["amount"]
  @exchange_rate = ExchangeRate.at(@date_requested, @from_currency, @to_currency)
  @converted_amount = ExchangeRate.convert(@date_requested, @from_currency, @to_currency, @amount)
  erb(:'create')
end