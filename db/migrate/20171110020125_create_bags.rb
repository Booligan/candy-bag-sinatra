class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :name
      t.integer :rating
      t.integer :user_id
      t.integer :candy_id
    end
  end
end
