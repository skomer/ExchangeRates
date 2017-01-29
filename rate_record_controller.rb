require_relative './models/rate_record.rb'
require_relative './models/feed.rb'
require_relative './models/exchange_rate.rb'

# index
# get '/rate_records' do
#   # @rate_records = RateRecord.all()
#   erb(:'index')
# end

# new
get '/rate_records/new' do
  erb(:'new')
end


# create
post '/rate_records' do
  @exchange_rate = ExchangeRate.at(params["date_requested"], params["from_currency"], params["to_currency"])
  erb(:'create')
end

# show
# get '/rate_records/:id' do
#   @rate_record = RateRecord.rate_record(params[:id])
#   erb(:'show')
# end