require 'sinatra'

require 'sinatra/activerecord'

set :database, 'sqlite3:microblog.sqlite3'
set :sessions, true

require './models'


get '/' do
  erb :index
end

post  '/' do
  User.create(username: params[:username],password: params[:password])
  user = User.where(username: params[:username]).first
  session[:user_id] = user.id
  redirect '/profile'
end

get '/signin' do
  erb :signin
end

post '/signin' do
  @user = User.where(username: params[:username]).first
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/profile'
    else
      redirect '/signin'
    end
end

get '/profile' do
  @user = User.find(session[:user_id])
  @blogs = @user.blogs
  erb :profile
end

post '/profile' do
  Blog.create(title: params[:title], content: params[:content], user_id: params[:user_id])
  redirect '/profile'
end

get '/blogs' do
  @blogs = Blog.all
  erb :blogs
end

get '/blog/:id' do
	@blog = Blog.find(params[:id])
	erb :blog
end
