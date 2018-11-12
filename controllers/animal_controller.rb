

get '/animals/type/:species/?' do
  @animals = Animal.by_species(params['species'].capitalize)
  erb( :'animals/species')
end

get '/animals/untrained/?' do
  @animals = Animal.untrained
  erb ( :'animals/untrained')
end

get '/animals/home/?' do
  @animals = Animal.all
  erb ( :'animals/home')
end

get '/animals/adoptable/?' do
  @animals = Animal.adoptable
  erb ( :'animals/adoptable')
end

get '/animals/dogs/?' do
  @dogs = Animal.dogs
  erb ( :'animals/dogs')
end

get '/animals/cats/?' do
  @cats = Animal.cats
  erb ( :'animals/cats')
end

get '/animals/others/?' do
  @others = Animal.others
  erb ( :'animals/others')
end

get '/animals/unwell/?' do
  @animals = Animal.unhealthy
  erb ( :'animals/unwell')
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
