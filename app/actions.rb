# Homepage (Root path)
helpers do

end

def current_user
  @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/profile' do
    erb :profile
end

get '/signup' do
  erb :signup
end

post '/login' do
   username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user.password == password
    session[:user_id] = user.id
    redirect '/'
    else
    redirect '/login'
  end

end

post '/profile' do
    redirect '/'
end

post '/signup' do
    username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user
    redirect '/signup'
  else
    user = User.create(username: username, password: password)
    session[:user_id] = user.id
    redirect '/'
end
end

get '/movies/new' do
  "Hello World"
end

post '/movies/create' do
  current_user.movies.create title: "Hey, it worked!"
end

post '/movies/create' do
    title = params[:title]
    director = params[:director]
    release = params[:release]

    current_user.movies.create title: title, director: director, release: release
    redirect "/movies/#{new_movie.id}"
end



get '/profile/edit' do

end

post '/profile/edit' do

end