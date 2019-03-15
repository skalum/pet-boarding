class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/home'
    else
      erb :'users/new'
    end
  end

  post '/signup' do
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      user = User.create(params[:user])
      if user.save
        addr = user.create_address(params[:address])
        addr.correct_address
      else
        redirect 'signup'
      end

      session[:user_id] = user.id
      redirect '/home'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/home'
    else
      erb :'users/login'
    end
  end

  get '/home' do
    if logged_in?
      if current_user.class == Owner
        @owner = current_user
        erb :'users/owners/dashboard'
      elsif current_user.class == Sitter
        @sitter = current_user
        erb :'users/sitters/dashboard'
      end
    else
      redirect '/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/home'
    else
      redirect '/login'
    end

  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/home'
    else
      redirect '/'
    end
  end
end
