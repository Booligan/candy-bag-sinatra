class CandyBag < ActiveRecord::Base
  belongs_to :candy
  belongs_to :bag
end
