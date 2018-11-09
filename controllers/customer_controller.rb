
#index
get '/customers/?' do
  @customers = Customer.all
  erb ( :'customers/index')
end
