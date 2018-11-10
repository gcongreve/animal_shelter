require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/animal.rb')
require_relative('./models/customer.rb')
require_relative('./models/adoption.rb')
also_reload('./models/*')


require_relative('./controllers/animal_controller')
require_relative('./controllers/customer_controller')
require_relative('./controllers/adoption_controller')


get '/' do
  erb(:index)
end
