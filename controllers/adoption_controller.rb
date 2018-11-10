
#index - list of all adoptions
get '/adoptions/?' do
  "Hello World"
  @adoptions = Adoption.all
  erb(:'adoptions/index')
end

#create new adoption in /new form
get '/adoptions/new/?' do
  @animals = Animal.all
  @customers = Customer.all
  erb (:'adoptions/new')
end

#posts adoptions detatils from /new to database
post '/adoptions/?' do
  @adoption = Adoption.new(params)
  @adoption.save
  erb(:'adoptions/create')
end

#edit adoption from id number
get '/adoptions/:id/edit/?' do
  @adoption = Adoption.find_by_id(params[:id])
  erb(:'adoptions/edit')
end



#show individual adoptions by id
get '/adoptions/:id/?' do
  @adoption = Adoption.find_by_id(params[:id])
  erb(:'adoptions/show')
end
