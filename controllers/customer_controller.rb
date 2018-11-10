
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

#edit individual customer by their id number
get '/customers/:id/edit/?' do
  @customer = Customer.find_by_id(params[:id])
  erb(:'customers/edit')
end

#post the edits to the database
post '/customers/:id/?' do
  @customer = Customer.new(params)
  @customer.update
  erb ( :'customers/update')
end

#delete individual customer from the database, using their id number from address bar. From /show view
post '/customers/:id/delete/?' do
  @customer = Customer.find_by_id(params[:id])
  @customer.delete
  redirect to '/customers'
end


#show each individual customer by their id number
get '/customers/:id/?' do
  @customer = Customer.find_by_id(params[:id])
  erb(:'customers/show')
end
