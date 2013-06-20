class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :topic
      t.string :content
      t.integer :last_user
      t.timestamps
    end
  end
end
