require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative 'rate_record_controller.rb'

get '/' do
  erb :home
end