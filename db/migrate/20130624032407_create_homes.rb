class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :user_id
      t.string :title
      t.string :content
      t.integer :viewed, default: 1
      t.integer :comment, default: 0
      t.timestamps
    end
  end
end
