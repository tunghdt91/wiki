class CreateEntertainments < ActiveRecord::Migration
  def change
    create_table :entertainments do |t|
      t.string :catalog
      t.string :title
      t.string :content
      t.string :user_post
      t.integer :viewed,  default: 1
      t.timestamps
    end
  end
end
