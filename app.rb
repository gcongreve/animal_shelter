require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/animal.rb')
also_reload('./models/*')


require_relative('./controllers/animal_controller')


get '/' do
  erb(:index)
end
