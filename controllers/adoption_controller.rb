
#index - list of all adoptions
get '/adoptions' do
  "Hello World"
  @adoptions = Adoption.all
  erb(:'adoptions/index')
end
