
get '/user/:id/history' do
  @user = User.find(params[:id])
  erb :history
end

get '/user/new' do
  
  erb :new_user
end

get '/user/:id' do
  @user = User.find(params[:id])
  @decks = Deck.all
  erb :user
end

# ============================

post '/user/:id' do
  @user = User.create(params[user])
  redirect to ('/user/:id')
end
