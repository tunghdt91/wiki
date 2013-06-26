class CreateMyfiles < ActiveRecord::Migration
  def change
    create_table :myfiles do |t|
      t.string :name_display
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
