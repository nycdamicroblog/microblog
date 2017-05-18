require 'sinatra'

require 'sinatra/activerecord'

set :database, 'sqlite3:microblog.sqlite3'

require './models'


get '/' do

  erb :index
end

post  '/' do
  User.create(username: params[:username],password: params[:password])
  redirect '/profile'
end


get '/sigin' do
  erb :signin
end

post '/signin' do
  @user = User.where(username: params[:username]).first
    if @user.password == params[:password]
      redirect '/profile'
    end
    else
      redirect '/signin'
    end
end

get '/profile' do
  erb :profile
end
