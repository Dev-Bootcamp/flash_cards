
get '/user/:id/history' do
  @user = User.find(params[:id])
  erb :history
end

get '/user/new' do
  erb :new_user
end

get '/invalid_login' do
  erb :invalid
end

get '/user/:id' do
  @user = User.find(params[:id])
  @decks = Deck.all
  erb :user
end

get '/logout' do
  @user = nil
  session.clear
  redirect to ('/')
end

# ============================

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect to ("/user/#{@user.id}")
  else
    redirect to ('/invalid_login')
  end
end

post '/user/:id' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect to ("/user/#{@user.id}")
end
