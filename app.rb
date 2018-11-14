require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/animal.rb')
require_relative('./models/customer.rb')
require_relative('./models/adoption.rb')
also_reload('./models/*')


require_relative('./controllers/animals_controller')
require_relative('./controllers/customers_controller')
require_relative('./controllers/adoptions_controller')


get '/' do
  erb(:index)
end
