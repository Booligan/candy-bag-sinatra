class BagsController < ApplicationController

  get '/bags' do
    if logged_in?
      @user = User.find_by_id(session[:user_id])
      erb :"bags/bags"
    else
      redirect to '/login'
    end
  end

end
