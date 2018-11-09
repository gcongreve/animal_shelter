require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/animal.rb')
require_relative('./models/customer.rb')
also_reload('./models/*')


require_relative('./controllers/animal_controller')
require_relative('./controllers/customer_controller')


get '/' do
  erb(:index)
end
