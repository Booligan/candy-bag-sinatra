class CandiesController < ApplicationController

  get '/candy/:bagid/new' do
    if logged_in?
      @bag = Bag.find_by_id(params[:bagid])
      erb :"candies/create_candy"
    else
      redirect to '/login'
    end
  end

  post '/candy/:bagid' do
    if params[:name].empty?
      @bag = Bag.find_by_id(params[:bagid])
      flash[:message] = "Candy needs a name."
      redirect to "/candy/#{@bag.id}/new"
    else
      @user = User.find_by_id(session[:user_id])
      @bag = Bag.find_by_id(params[:bagid])
      @candy = Candy.create(name: params[:name],rating: params[:rating])
      @bag.candies << @candy
      redirect to "/bags/#{@user.username}/#{@bag.id}"
    end
  end

  get '/candy/:bagid/:candyid/edit' do
    @bag = Bag.find_by_id(params[:bagid])
    @candy = Candy.find_by_id(params[:candyid])
    erb :"candies/edit"
  end

  patch '/candy/:bagid/:candyid' do
    @user = User.find_by_id(session[:user_id])
    @bag = Bag.find_by_id(params[:bagid])
    @candy = Candy.find_by_id(params[:candyid])
    @candy.update(name: params[:name], rating: params[:rating])
    redirect to "/bags/#{@user.username}/#{@bag.id}"
  end

  delete '/candy/:bagid/:candyid/delete' do
    @user = User.find_by_id(session[:user_id])
    @bag = Bag.find_by_id(params[:bagid])
    @candy = Candy.find_by_id(params[:candyid])
    @candy.delete
    redirect to "/bags/#{@user.username}/#{@bag.id}"
  end

end
