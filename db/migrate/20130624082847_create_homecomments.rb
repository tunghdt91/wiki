class CreateHomecomments < ActiveRecord::Migration
  def change
    create_table :homecomments do |t|
      t.integer :user_id
      t.string :content
      t.integer :home_id

      t.timestamps
    end
  end
end
