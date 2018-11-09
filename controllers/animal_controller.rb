

#index
get '/animals/?' do
  "Hello World"
  @animals = Animal.all
  erb ( :'animals/index' )
end

#show individual
get '/animals/:id/?' do
  @animal = Animal.find_by_id(params[:id])
  erb ( :'animals/show' )
end
