class RemoveRatingFromBags < ActiveRecord::Migration
  def change
    remove_column :bags, :rating
  end
end
