

#index
get '/animals/?' do
  "Hello World"
  @animals = Animal.all
  erb ( :'animals/index' )
end

#show individual
get '/animals/:id/?' do
  @animal = Animal.find(params[:id])
  erb(:'animals/show')
end
