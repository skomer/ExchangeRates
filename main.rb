require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative 'fx_controller.rb'

get '/' do
  erb :home
end