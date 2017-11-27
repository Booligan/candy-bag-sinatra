class Bag < ActiveRecord::Base
  belongs_to :user
  has_many :candy_bags
  has_many :candies, through: :candy_bags

  def rating
    self.candies.average(:rating).to_i
  end

end
