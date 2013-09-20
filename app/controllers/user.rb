
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
  erb :user
end

get '/logout' do
  @user = nil
  redirect to ('/')
end

# ============================

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.password == params[:user][:password]
    redirect to ("/user/#{@user.id}")
  else
    redirect to ('/invalid_login')
  end
end

post '/user/:id' do
  @user = User.create(params[:user])
  redirect to ("/user/#{@user.id}")
end
