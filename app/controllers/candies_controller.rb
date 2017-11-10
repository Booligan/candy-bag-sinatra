class CandiesController < ApplicationController

  get '/candy/:id/new' do
    if logged_in?
      @bag = Bag.find_by_id(params[:id])
      erb :"candies/create_candy"
    else
      redirect to '/login'
    end
  end

  post '/candy/:bagid' do
    if params[:name] == nil
      @bag = Bag.find_by_id(params[:bagid])
      redirect to "/candy/#{@bag.id}/new"
    else
      @user = User.find_by_id(session[:user_id])
      @bag = Bag.find_by_id(params[:bagid])
      @candy = Candy.create(name: params[:name],rating: params[:rating])
      @bag.candies << @candy
      redirect to "/bags/#{@user.username}/#{@bag.id}"
    end
  end

end
