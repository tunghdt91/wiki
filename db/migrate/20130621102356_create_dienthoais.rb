class CreateDienthoais < ActiveRecord::Migration
  def change
    create_table :dienthoais do |t|
      t.integer :user_id
      t.string :title
      t.string :content
      t.string :file_name
      t.string :file_path

      t.timestamps
    end
  end
end
