class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to "/bags"
    else
      erb :"users/sign_up"
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:password].empty? || params[:email].empty?
      redirect to '/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect to "/bags"
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/bags"
    else
      erb :"users/login"
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/bags"
    else
      flash[:message] = "Incorrect Username or Password."
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
