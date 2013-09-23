get '/user/:id/history' do
  @user = User.find(params[:id])
  if request.xhr?
    erb :_history, layout: false
  else
    erb :history
  end 
end

get '/user/new' do
  erb :new_user
end

get '/user/new/error' do
  @error = "Invalid email or password.  Please try again."
  erb :new_user
end

get '/invalid_login' do
  erb :invalid
end

get '/user/:id' do
  @user = User.find(params[:id])
  @decks = Deck.all
  if request.xhr?
    erb :user, layout: false
  else
    erb :user
  end
end

get '/logout' do
  @user = nil
  session.clear
  redirect to ('/')
end

# ===POST=========================

post '/login' do
  @user = User.authenticate(params[:email],
                            params[:password]) #moved authentication to user model
  if @user
    session[:user_id] = @user.id
    redirect to ("/user/#{@user.id}")
  else
    redirect to ('/invalid_login')
  end
end

post '/user/:id' do
  @user = User.create(params[:user])
  if @user.valid?
    session[:user_id] = @user.id
    redirect to ("/user/#{@user.id}")
  else
    redirect to ('/user/new/error')
  end
end
