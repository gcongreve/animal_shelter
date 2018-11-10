
#index - list of all customers
get '/customers/?' do
  @customers = Customer.all
  erb ( :'customers/index')
end

#add customer details on /new form
get '/customers/new/?' do
  erb (:'customers/new')
end

#posts customer detatils from /new to database
post '/customers/?' do
  @customer = Customer.new(params)
  @customer.save
  erb(:'customers/create')
end
