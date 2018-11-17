
get '/animals/status/:status/?' do
  @animals = Animal.by_status(params['status'])
  @status_text = Animal.route_to_status(params['status'])
  erb( :'animals/status')
end

get '/animals/type/:species/?' do
  @animals = Animal.by_species(params['species'].capitalize)
  erb( :'animals/species')
end

get '/animals/home/?' do
  @animals = Animal.all
  erb ( :'animals/home')
end


#index
get '/animals/?' do
  @animals = Animal.all
  erb ( :'animals/index' )
end

# new
get '/animals/new/?' do
  erb(:'animals/new')
end

# create
post '/animals/?' do
  @animal = Animal.new(params)
  @animal.save
  erb(:'animals/create')
end

# edit
get '/animals/:id/edit/?' do
  @animal = Animal.find_by_id(params[:id])
  erb( :'animals/edit')
end

#update
post '/animals/:id/?' do
  @animal = Animal.new(params)
  @animal.update
  erb ( :'animals/update')
end

#show individual
get '/animals/:id/?' do
  @animal = Animal.find_by_id(params[:id])
  erb ( :'animals/show' )
end

# destroy
post '/animals/:id/delete/?' do
  @animal = Animal.find_by_id(params[:id])
  @animal.delete
  redirect to "/animals"
end
