
get '/user/:id/history' do
  
  erb :history
end

get '/user/new' do
  
  erb :new_user
end

get '/user/:id' do
  
  erb :user
end

# ============================

post '/user/:id' do
  @user = User.create(params[user])
  redirect to ('/user/:id')
end
