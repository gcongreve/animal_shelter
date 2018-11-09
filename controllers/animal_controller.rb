require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/animal')
also_reload('models')


get '/animals' do
  @animals = Animals.all
  erb(:'animals/index')
end
