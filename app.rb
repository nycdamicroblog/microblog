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
