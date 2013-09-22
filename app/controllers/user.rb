
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
  begin
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect to ("/user/#{@user.id}")
  rescue
    @error = "Error! failed to create user. Please try again."
    erb :new_user
  end
end
