class User < ActiveRecord::Base
  has_many :bags
  has_many :candies, through: :bags
end
