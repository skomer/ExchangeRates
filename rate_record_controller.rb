require_relative './models/fx_rate.rb'
require_relative './models/feed.rb'

# index
get '/fx_rates' do
  # @fx_rates = FxRate.all()
  erb(:'index')
end

# new
get '/fx_rates/new' do
  erb(:'new')
end


# should this one go in a feed_controller? It's really a /feed post route
# create
post '/fx_rates' do
  @feed = Feed.new("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml")
  @feed.construct_and_save_fx_rates_objects()
  erb(:'create')
end

# show
get '/fx_rates/:id' do
  @fx_rate = FxRate.fx_rate(params[:id])
  erb(:'show')
end