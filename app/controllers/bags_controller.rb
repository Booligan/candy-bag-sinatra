class BagsController < ApplicationController

  get '/bags' do
   if logged_in?
      @user = User.find_by_id(session[:user_id])
      erb :"bags/bags"
    else
      redirect to '/login'
    end
  end

  get '/bags/new' do
    if logged_in?
      erb :"bags/create_bag"
    else
      redirect to '/login'
    end
  end

  get '/bags/public' do
    @users = User.all
    erb :"bags/public"
  end

  get '/bags/:username' do
    @user = User.find_by(username: params[:username])
    @bags = @user.bags
    erb :"bags/show"
  end

  post '/bags' do
    if params[:name] == nil
      redirect to '/bags/new'
    else
      @user = User.find_by_id(session[:user_id])
      @bag = Bag.create(params)
      @user.bags << @bag
      redirect to "/bags/#{@user.username}/#{@bag.id}"
    end
  end

  get '/bags/:username/:bagid' do
    @user = User.find_by(username: params[:username])
    @bag = Bag.find_by_id(params[:bagid])
    erb :"bags/bag"
  end

  post '/bags/:username/:bagid' do
    @user = User.find_by(username: params[:username])
    @bag = Bag.find_by_id(params[:bagid])
    @bag.update(rating: params[:rating])
    redirect to "/bags/#{@user.username}"
  end

  post '/bags/:username/:bagid/delete' do
    @user = User.find_by(username: params[:username])
    @bag = Bag.find_by_id(params[:bagid])
    @bag.delete
    redirect to "/bags/#{@user.username}"
  end

end
