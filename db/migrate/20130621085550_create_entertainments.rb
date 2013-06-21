class CreateEntertainments < ActiveRecord::Migration
  def change
    create_table :entertainments do |t|
      t.string :catalog
      t.string :title
      t.string :content
      t.string :picture
      t.integer :price
      t.timestamps
    end
  end
end
