require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative 'rate_record_controller.rb'
require_relative 'feed_controller.rb'
require_relative 'exchange_rate_controller.rb'

get '/' do
  erb :home
end