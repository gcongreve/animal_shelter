

#index
get '/animals/?' do
  "Hello World"
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



  # <br>
  # <label for="adoptable">Date Admitted: </label>
  # <input id="adoptable" type="text" name="adoptable" value="<%= @animal.adoptable %>">
  #
  # <br>
  # <label for="trained">Date Admitted: </label>
  # <input id="trained" type="text" name="trained" value="<%= @animal.trained %>">
  #
  # <br>
  # <label for="adopted">Date Admitted: </label>
  # <input id="adopted" type="text" name="adopted" value="<%= @animal.adopted %>">
