class Candy < ActiveRecord::Base
  has_many :candy_bags
  has_many :bags, through: :candy_bags
  has_many :users, through: :bags
end
