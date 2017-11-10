class CandiesController < ApplicationController

  get 'candy/new' do
    if logged_in?
      erb :"candies/new"
    else
      redirect to '/login'
    end
  end

end
