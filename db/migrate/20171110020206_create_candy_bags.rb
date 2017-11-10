class CreateCandyBags < ActiveRecord::Migration
  def change
    create_table :candy_bags do |t|
      t.integer :candy_id
      t.integer :bag_id
    end
  end
end
