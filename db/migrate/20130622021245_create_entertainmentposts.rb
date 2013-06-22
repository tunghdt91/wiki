class CreateEntertainmentposts < ActiveRecord::Migration
  def change
    create_table :entertainmentposts do |t|
      t.string :content
      t.integer :user_id
      t.integer :entertainment_id

      t.timestamps
    end
    add_index :entertainmentposts, [:created_at]
  end
end
