require_relative './models/rate_record.rb'
require_relative './models/feed.rb'

# index
get '/rate_records' do
  # @rate_records = RateRecord.all()
  erb(:'index')
end

# new
get '/rate_records/new' do
  erb(:'new')
end


# should this one go in a feed_controller? It's really a /feed post route
# create
post '/rate_records' do
  @feed = Feed.new("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml")
  @feed.construct_and_save_rate_records()
  erb(:'create')
end

# show
get '/rate_records/:id' do
  @rate_record = RateRecord.rate_record(params[:id])
  erb(:'show')
end