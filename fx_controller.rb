require_relative './models/fx_rate.rb'

# index
get '/fx_rates' do
  @fx_rates = FxRate.all()
  erb(:'index')
end

# new
get '/fx_rates/new' do
  erb(:'new')
end

# create
post '/fx_rates' do
  @fx_rate = FxRate.new(params)
  @fx_rate.save()
  erb(:'create')
end

# show
get '/fx_rates/:id' do
  @fx_rate = FxRate.fx_rate(params[:id])
  erb(:'show')
end